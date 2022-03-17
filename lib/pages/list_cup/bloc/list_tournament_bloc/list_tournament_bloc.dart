import "dart:async";
import 'dart:convert';

import "package:bloc/bloc.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:equatable/equatable.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import "package:o_spawn_cup/models/game_name.dart";
import 'package:o_spawn_cup/services/firebase_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'list_tournament_event.dart';
part 'list_tournament_state.dart';

class ListTournamentBloc extends Bloc<ListTournamentEvent, ListTournamentState> {
  late SharedPreferences filters;
  List<Tournament> _listTournament = [];
  GameName gameName;
  ListTournamentBloc({required this.gameName}) : super(TournamentLoading()) {
    clearPref();
    on<TournamentInitialisation>(_initListTournament);
    on<TournamentFilter>(_onTournamentFetched);

  }
  // late StreamSubscription _streamSubscription;

  Future<void> clearPref() async {
    filters = await SharedPreferences.getInstance();
    filters.clear();
  }


  Future<FutureOr<void>> _onTournamentFetched(TournamentFilter event, Emitter<ListTournamentState> emit) async {

    emit(TournamentLoading());

    String? name = event.name;
    TournamentState? tournamentState = event.tournamentState;
    TournamentType? type = event.tournamentType;
    String? dateDay = event.day;
    String? dateMonth = event.month;
    String? dateYears = event.year;
    String date = dateYears + dateMonth + dateDay;


    await tournamentsRef.reference
        .orderBy("dateDebutTournois", descending: true)
        .where("game", isEqualTo: gameName.state)
        .where("name", isEqualTo: (name == "") ? null : name)
        .where("dateDebutTournois", isGreaterThanOrEqualTo: (date == "") ? null : int.parse(date))
        .where("state", isEqualTo: tournamentState?.state)
        .where("tournamentType.name", isEqualTo: type?.name)
        // .orderBy("date", descending: true)
        .snapshots()
        .forEach(
          (event) {
        _listTournament = event.docs.map((e) => e.data()).cast<Tournament>().toList();
        event.docs.asMap().forEach((key, value) {
          _listTournament[key].documentId = value.id;
          changeStateTournament(_listTournament[key]);
        });
        emit(TournamentLoaded(tournaments: _listTournament,));
      },
    );
  }
  changeStateTournament(Tournament tournament){
      FirebaseHandler().checkTournamentState(tournament);
  }
  Future<FutureOr<void>> _initListTournament(TournamentInitialisation event, Emitter<ListTournamentState> emit) async {
    gameName = event.gameName;
    emit(TournamentLoading());
    await tournamentsRef.reference
        .orderBy("dateDebutTournois", descending: true)
        .where("game", isEqualTo: gameName.state)
        .snapshots()
        .forEach(
          (event) {
        _listTournament = event.docs.map((e) => e.data()).cast<Tournament>().toList();
        event.docs.asMap().forEach((key, value) {
          _listTournament[key].documentId = value.id;
          changeStateTournament(_listTournament[key]);
        });

        emit(TournamentLoaded(tournaments: _listTournament));
      },
    );

  }
}
