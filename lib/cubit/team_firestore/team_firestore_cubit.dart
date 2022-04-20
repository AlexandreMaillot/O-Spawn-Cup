import "dart:math";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/services/MyMessage.dart';
import 'package:o_spawn_cup/services/email_broker.dart';
import 'package:o_spawn_cup/services/email_message.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';

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
    FirebaseStatusEvent memberDisqualified = await FirebaseHandler().disqualificationMember(tournament, team, memberTournament);
    if(memberDisqualified == FirebaseStatusEvent.disqualifiedSuccess){
      listMemberTournament.removeAt(index);
    }
    emit(TeamFirestoreSelected(indexSelect: indexSelect,status: memberDisqualified));
  }

  changeStatShow(bool global){

  }
  addMemberInTeam(Tournament tournament,String teamName,String gamerTag) async {
    FirebaseStatusEvent firebaseEvent = await FirebaseHandler().addMemberWithCodeTeam(tournament, teamName, gamerTag);

    emit(TeamFirestoreSelected(indexSelect: null,status: firebaseEvent));
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
    emit(TeamFirestoreSelected(indexSelect: indexSelect,status: FirebaseStatusEvent.changeRowSuccess ));
  }
  getTeamsTournament(Tournament tournament) async {
    emit(TeamFirestoreLoading());
    listTeam = await FirebaseHandler().getTeamsInTournament(tournament);
    teamNumber = listTeam.length;
    emit(TeamFirestoreLoaded(listTeam: listTeam,));
  }
  addNewTeam(Tournament tournament,String teamName,String gamerTag) async {

    emit(TeamFirestoreLoading());
    List listReturn = await FirebaseHandler().addTeamInTournament(tournament, Team(name: teamName), gamerTag);

    if(listReturn[1] != null){
      await FirebaseHandler().verifStateCup(teamNumber, tournament);
      listTeam.add(listReturn[1]);
      // // MyMessage myMessage = EmailMessage(EmailBroker());
      // myMessage.sendMessageWelcomeMethod(tournament, listReturn[1], FirebaseAuth.instance.currentUser!.email);
      // myMessage.sendMessageTeamCodeMethod(tournament, listReturn[1], FirebaseAuth.instance.currentUser!.email);
    }

    teamNumber = listTeam.length;

    emit(TeamFirestoreLoaded(listTeam: listTeam,status: listReturn[0]));
  }
  disqualifiedTeam(int index,Tournament tournament) async {
    FirebaseStatusEvent event;
    emit(TeamFirestoreRemoved());
    bool teamRemoved = await FirebaseHandler().verifTeamEmpty(tournament, listTeam[index]);
    if(teamRemoved){
      listTeam.removeAt(index);
      teamNumber = listTeam.length;
      event = FirebaseStatusEvent.disqualifiedSuccess;
    } else {
      event = FirebaseStatusEvent.teamNotEmpty;
    }
    indexSelect = index;
    emit(TeamFirestoreLoaded(listTeam: listTeam,status: event));
  }
}
