import "dart:async";

import "package:bloc/bloc.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:equatable/equatable.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/game_name.dart";
import 'package:shared_preferences/shared_preferences.dart';

part 'tournament_event.dart';
part 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  GameName gn;
  late SharedPreferences filters;
  List<Tournament> _listTournament = [];

  TournamentBloc({required this.gn}) : super(TournamentLoading()) {
    clearPref();
    on<TournamentInitialisation>(_initListTournament);
    on<TournamentLoad>(_onTournamentFetched);

  }
  // late StreamSubscription _streamSubscription;

  Future<void> clearPref() async {
    filters = await SharedPreferences.getInstance();
    filters.clear();
  }


  Future<FutureOr<void>> _onTournamentFetched(TournamentLoad event, Emitter<TournamentState> emit) async {
    emit(TournamentLoading());
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

    await tournamentsRef.reference
        .orderBy("date", descending: true)
        .where("game", isEqualTo: gn.state)
        .where("name", isEqualTo: (name == "") ? null : name)
        .where("date", isGreaterThanOrEqualTo: (date == "") ? null : int.parse(date))
        .where("state", isEqualTo: (state == "") ? null : state)
        .where("tournamentType.name", isEqualTo: (type == "") ? null : type)
        .orderBy("date", descending: true)
        .snapshots()
        .forEach(
          (event) {
        _listTournament = event.docs.map((e) => e.data()).cast<Tournament>().toList();
        event.docs.asMap().forEach((key, value) {
          _listTournament[key].documentId = value.id;
        });
        emit(TournamentLoaded(tournaments: _listTournament));
      },
    );
  }

  Future<FutureOr<void>> _initListTournament(TournamentInitialisation event, Emitter<TournamentState> emit) async {
    emit(TournamentLoading());
    await tournamentsRef.reference
        .orderBy("date", descending: true)
        .where("game", isEqualTo: gn.state)
        .snapshots()
        .forEach(
          (event) {
        _listTournament = event.docs.map((e) => e.data()).cast<Tournament>().toList();
        event.docs.asMap().forEach((key, value) {
          _listTournament[key].documentId = value.id;
        });
        emit(TournamentLoaded(tournaments: _listTournament));
      },
    );

  }
}
