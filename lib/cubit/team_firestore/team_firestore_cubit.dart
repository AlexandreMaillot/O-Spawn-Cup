import "dart:math";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/service/firebase_handler.dart';

import '../../models/Team/team.dart';
import '../../models/Tournament/tournament.dart';

part "team_firestore_state.dart";

class TeamFirestoreCubit extends Cubit<TeamFirestoreState> {
  TeamFirestoreCubit() : super(TeamFirestoreInitial([]));

  getTeamsTournament(Tournament tournament) async {
    emit(TeamFirestoreLoading([]));
    List<Team>? listTeam = await FirebaseHandler().getTeamsInTournament(tournament);
    emit(TeamFirestoreLoaded(listTeam));
  }

}
