import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as mem;
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

part 'cup_detail_state.dart';
enum statePlacesRestante {isFull,isNotFull}

class CupDetailCubit extends Cubit<CupDetailState> {
  TeamRepository teamRepository;
  AppBloc appBloc;
  late MemberTournamentRepository memberTournamentRepository;
  late MemberRepository memberRepository;
  late TournamentRepository tournamentRepository;
  List<Team> listTeam = [];
  List<MemberTournament> listMemberTournament = [];

  late mem.Member member;
  Tournament? tournament;
  CupDetailCubit({required this.tournamentRepository,required this.teamRepository,required this.memberRepository,required this.appBloc}) : super(CupDetailInitial()){
    _init();
  }

  _init(){

     teamRepository.listAllMemberTournamentInTeamCollection().listen((event) {
      listMemberTournament = event;
      emit(CupDetailListMemberTournamentChanged(listMemberTournament: listMemberTournament));
    });
    memberRepository.currentMember(appBloc.state.user.id).listen((event) {
      if(event != null) {
        member = event;
        emit(CupDetailMemberChanged(member: member));
      }
    });
    teamRepository.listTeamStream.listen((event) {
      listTeam = event;
      emit(CupDetailListTeamChanged(listTeam: listTeam));
    });
    teamRepository.teamCollectionReference.parent.snapshots().listen((event) {
      if(event.data != null) {
        tournament = event.data!;
        tournament?.documentId = event.id;
          emit(CupDetailTournamentChanged(tournament: tournament,isClose: checkStateTournament(tournament!)));
      }
    });
  }
  closeCup(){
    tournamentRepository.cupClose(tournament!);
  }
  statePlacesRestante placesRestante(Tournament tournois, List<Team> teams){
    var places = tournois.capacity - teams.length;
    if(places > 0) {
      return statePlacesRestante.isNotFull;
    } else {
      return statePlacesRestante.isFull;
    }

  }

  bool currentMemberIsSign(){
    return tournamentRepository.memberIsSign(member,listMemberTournament);
  }
  addMemberTournament(String gamerTag,RoleType roleType,String teamName) async {
    TeamDocumentReference teamDocReference;
    if(placesRestante(tournament!,listTeam) == statePlacesRestante.isNotFull) {
      if(isLeader(roleType)) {
        if(await teamNameNotExist(teamName)) {
          teamDocReference = await teamRepository.addTeamInTournament(Team(name: teamName),);
          memberTournamentRepository = MemberTournamentRepository(memberTournamentCollectionReference: MemberTournamentCollectionReference(teamDocReference.reference));
          memberTournamentRepository.addMemberTournamentInTeam(member, gamerTag, roleType);
          emit(CupDetailMemberTournamentAdded());
        } else {
          emit(CupDetailErrorMemberTournamentAdded(errorMsg: 'Nom de team existante'));
        }

      }
      if(isPlayer(roleType)){
        var team = await teamRepository.findTeamWithCode(teamName);
        if(findTeam(team)) {
          memberTournamentRepository = MemberTournamentRepository(memberTournamentCollectionReference: MemberTournamentCollectionReference(team!.reference.reference));
          memberTournamentRepository.addMemberTournamentInTeam(member, gamerTag, roleType);
          emit(CupDetailMemberTournamentAdded());
        } else {
          emit(CupDetailErrorMemberTournamentAdded(errorMsg: 'Code team non reconnu'));
        }
      }
    } else {
      emit(CupDetailErrorMemberTournamentAdded(errorMsg: 'Tournois full'));
    }
  }

  bool findTeam(TeamDocumentSnapshot? team) => team != null;

  Future<bool> teamNameNotExist(String teamName) async => await teamRepository.checkNameTeam(teamName);

  bool isPlayer(RoleType roleType) => roleType == RoleType.player;

  bool isLeader(RoleType roleType) => roleType == RoleType.leader;

  bool checkStateTournament(Tournament tournament) {
    if(tournament.state == TournamentState.inscriptionFermer ||
        tournament.state == TournamentState.annuler ||
        tournament.state == TournamentState.complet ||
        tournament.state == TournamentState.terminer) {
      return true;
    } else {
      return false;
    }

  }

}
