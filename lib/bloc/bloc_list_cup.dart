import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:o_spawn_cup/bloc/bloc.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:shared_preferences/shared_preferences.dart";

class BlocListCup extends Bloc {
  GameName gameName;
  late SharedPreferences filters;
  late List<Tournament> tournamentList = [];

  final _streamController = StreamController<List<Tournament>>();

  Stream<List<Tournament>> get stream => _streamController.stream;
  Sink<List<Tournament>> get sink => _streamController.sink;

  loadCup() {
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
        .where("game", isEqualTo: gameName.name)
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
    });
    // tournamentsRef.get()snapshots()
    sink.add(tournamentList);

  }

  BlocListCup({required this.gameName,}) {
    clearPref();

    Stream<QuerySnapshot<Object?>> querySnap = tournamentsRef.reference
        .orderBy("date", descending: true)
        .where("game", isEqualTo: gameName.name)
        .snapshots();
    Stream<List<QueryDocumentSnapshot<Object?>>> listSnap =
        querySnap.map((event) => event.docs);

    var t;
    listSnap.forEach((element) {
      tournamentList = element.map((e) => e.data()).cast<Tournament>().toList();
      t = element.map((e) => e).toList();
      t.asMap().forEach((key, value) {
        tournamentList[key].name = "plop";

      });

      // tournamentList
    }).then((value) => sink.add(tournamentList));

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
