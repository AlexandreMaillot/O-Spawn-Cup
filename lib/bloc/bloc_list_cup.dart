import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:o_spawn_cup/bloc/bloc.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/game_name.dart";
import 'package:o_spawn_cup/service/firebase_handler.dart';
import "package:shared_preferences/shared_preferences.dart";

class BlocListCup extends Bloc {
  GameName gameName;
  late SharedPreferences filters;
  late List<Tournament> tournamentList = [];

  final _streamController = StreamController<List<Tournament>>();

  Stream<List<Tournament>> get stream => _streamController.stream;
  Sink<List<Tournament>> get sink => _streamController.sink;

  loadCup() {
    print("ok");
    String? name = filters.getString("tournamentName");
    String? state = filters.getString("tournamentState");

    if (state == "null") {
      state = "";
    }
    String? type = filters.getString("tournamentType");
    if (type == "null") {
      type = "";
    }

    String? dateDay = filters.getString("day");
    String? dateMonth = filters.getString("month");
    String? dateYears = filters.getString("years");
    String date = dateYears! + dateMonth! + dateDay!;

    // tournamentList =
    Stream<QuerySnapshot<Object?>> querySnap = tournamentsRef.reference
        .where("game", isEqualTo: gameName.state)
        .where("name", isEqualTo: (name == "") ? null : name)
        .where("date",
        isGreaterThanOrEqualTo: (date == "") ? null : int.parse(date))
        .where("state", isEqualTo: (state == "") ? null : state)
        .where("tournamentType.name", isEqualTo: (type == "") ? null : type)
        .orderBy("date", descending: true)
        .snapshots();
    Stream<List<QueryDocumentSnapshot<Object?>>> listSnap = querySnap.map((event) => event.docs);
    listSnap.forEach((element) {
      tournamentList = element.map((e) => e.data()).cast<Tournament>().toList();
      changeStateTournament(tournamentList);
      sink.add(tournamentList);
    });
    // tournamentsRef.get()snapshots()


  }
  changeStateTournament(List<Tournament> listTournament){
    print(1);
    print(2);
    for (var element in listTournament) {
      FirebaseHandler().checkTournamentState(element);
    }
  }
  BlocListCup({required this.gameName,}) {
    clearPref();
    print("ossk");
    Stream<QuerySnapshot<Object?>> querySnap = tournamentsRef.reference
        .orderBy("date", descending: true)
        .where("game", isEqualTo: gameName.state)
        .snapshots();
    Stream<List<QueryDocumentSnapshot<Object?>>> listSnap =
        querySnap.map((event) => event.docs);
    listSnap.forEach((element) {
      tournamentList = element.map((e) => e.data()).cast<Tournament>().toList();
      element.asMap().forEach((key, value) {
        tournamentList[key].documentId = value.id;
      });

      changeStateTournament(tournamentList);
      sink.add(tournamentList);

    });


    // tournamentList =
  }

  Future<void> clearPref() async {
    filters = await SharedPreferences.getInstance();
    filters.clear();
  }

  @override
  dispose() {
    _streamController.close();
  }
}
