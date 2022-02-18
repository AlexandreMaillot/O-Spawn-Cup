import "dart:math";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/service/firebase_handler.dart';

import '../../models/Member/member.dart';
import '../../models/MemberTournament/member_tournament.dart';
import '../../models/Team/team.dart';
import '../../models/Tournament/tournament.dart';

part "team_firestore_state.dart";

class TeamFirestoreCubit extends Cubit<TeamFirestoreState> {
  List<Team> listTeam = [];
  int teamNumber = 0;
  List<MemberTournament> listMemberTournament = [];
  List<Member?> listMember = [];
  int? indexSelect;
  TeamFirestoreCubit() : super(TeamFirestoreInitial());

  disqualificationMember(int index,Tournament tournament,Team team,MemberTournament memberTournament) async {
    bool memberDisqualified = await FirebaseHandler().disqualificationMember(tournament, team, memberTournament);
    if(memberDisqualified){
      listMemberTournament.removeAt(index);
    }

    emit(TeamFirestoreSelected(indexSelect: indexSelect));
  }

  addMemberInTeam(Tournament tournament,String teamName,String gamerTag){
    FirebaseHandler().addMemberWithCodeTeam(tournament, teamName, gamerTag);
    emit(TeamFirestoreSelected(indexSelect: null));
  }

  changeRowSelect(int index,Tournament tournament,) async {

    if(indexSelect == index){
      indexSelect = null;
    } else {
      indexSelect = index;
        listMemberTournament = await FirebaseHandler().getMemberTournamentInTournament(tournament, listTeam[index]);
        for(var element in listMemberTournament) {
          listMember.add(await FirebaseHandler().getMemberInTournament(tournament, listTeam[index], element));
        }
    }
    emit(TeamFirestoreSelected(indexSelect: indexSelect));
  }
  getTeamsTournament(Tournament tournament) async {
    emit(TeamFirestoreLoading());
    listTeam = await FirebaseHandler().getTeamsInTournament(tournament);
    teamNumber = listTeam.length;
    emit(TeamFirestoreLoaded(listTeam: listTeam,));
  }
  addNewTeam(Tournament tournament,String teamName,String gamerTag) async {
    emit(TeamFirestoreLoading());
    Team? team = await FirebaseHandler().addTeamInTournament(tournament, Team(name: teamName), gamerTag);
    await FirebaseHandler().verifStateCup(teamNumber, tournament);
    if(team != null) {
      listTeam.add(team);
      teamNumber = listTeam.length;
    }
    emit(TeamFirestoreLoaded(listTeam: listTeam,));
  }
  disqualifiedTeam(int index,Tournament tournament) async {
    emit(TeamFirestoreRemoved());
    bool teamRemoved = await FirebaseHandler().verifTeamEmpty(tournament, listTeam[index]);
    if(teamRemoved){
      listTeam.removeAt(index);
      teamNumber = listTeam.length;
    }
    indexSelect = index;
    emit(TeamFirestoreLoaded(listTeam: listTeam,));
  }
}
