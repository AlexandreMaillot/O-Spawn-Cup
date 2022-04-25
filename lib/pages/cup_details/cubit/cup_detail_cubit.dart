import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as mem;
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';
import 'package:o_spawn_cup/services/email_message.dart';

part 'cup_detail_state.dart';

enum statePlacesRestante { isFull, isNotFull }

class CupDetailCubit extends Cubit<CupDetailState> {
  TeamRepository teamRepository;
  AppBloc appBloc;
  MemberTournamentRepository? memberTournamentRepository;
  late MemberRepository memberRepository;
  late TournamentRepository tournamentRepository;
  late EmailMessage emailMessage;
  List<Team> listTeam = [];
  List<MemberTournament> listMemberTournament = [];

  late mem.Member member;
  Tournament? tournament;
  CupDetailCubit({
    required this.tournamentRepository,
    required this.teamRepository,
    required this.memberRepository,
    required this.appBloc,
    this.memberTournamentRepository,
    required this.emailMessage,
  }) : super(CupDetailInitial()) {
    _init();
  }

  void _init() {
    teamRepository.listAllMemberTournamentInTeamCollection().listen((event) {
      listMemberTournament = event;
      emit(
        CupDetailListMemberTournamentChanged(
          listMemberTournament: listMemberTournament,
        ),
      );
    });
    memberRepository.currentMember(appBloc.state.user!.id).listen((event) {
      if (event != null) {
        member = event;
        emit(CupDetailMemberChanged(member: member));
      }
    });
    teamRepository.listTeamStream.listen((event) {
      listTeam = event;
      emit(CupDetailListTeamChanged(listTeam: listTeam));
    });
    teamRepository.teamCollectionReference.parent.snapshots().listen((event) {
      if (event.data != null) {
        tournament = event.data;
        tournament?.documentId = event.id;
        emit(
          CupDetailTournamentChanged(
            tournament: tournament,
            isClose: checkStateTournament(tournament!),
          ),
        );
      }
    });
  }

  void closeCup() {
    tournamentRepository.cupClose(tournament!);
  }

  statePlacesRestante placesRestante(Tournament tournois, List<Team> teams) {
    final places = tournois.capacity - teams.length;

    return places > 0
        ? statePlacesRestante.isNotFull
        : statePlacesRestante.isFull;
  }

  bool currentMemberIsSign() {
    return tournamentRepository.memberIsSign(member, listMemberTournament);
  }

  Future addMemberTournament({
    required String gamerTag,
    required RoleType roleType,
    required String teamName,
  }) async {
    TeamDocumentReference teamDocReference;
    if (placesRestante(tournament!, listTeam) ==
        statePlacesRestante.isNotFull) {
      if (isLeader(roleType)) {
        if (await teamNameNotExist(teamName)) {
          final team = Team(name: teamName);

          teamDocReference = await teamRepository.addTeamInTournament(
            team,
          );
          memberTournamentRepository ??= MemberTournamentRepository(
            memberTournamentCollectionReference:
                MemberTournamentCollectionReference(
              teamDocReference.reference,
            ),
          );
          memberTournamentRepository!
              .addMemberTournamentInTeam(member, gamerTag, roleType);
          emit(const CupDetailMemberTournamentAdded());
          emailMessage
            ..sendMessageWelcomeMethod(
              tournament!,
              team,
              appBloc.state.user!.email,
            )
            ..sendMessageTeamCodeMethod(
              tournament!,
              team,
              appBloc.state.user!.email,
            );
        } else {
          emit(
            const CupDetailErrorMemberTournamentAdded(
              errorMsg: 'Nom de team existante',
            ),
          );
        }
      }
      if (isPlayer(roleType)) {
        final team = await teamRepository.findTeamWithCode(teamName);
        if (findTeam(team)) {
          memberTournamentRepository ??= MemberTournamentRepository(
            memberTournamentCollectionReference:
                MemberTournamentCollectionReference(
              team!.reference.reference,
            ),
          );

          memberTournamentRepository!
              .addMemberTournamentInTeam(member, gamerTag, roleType);
          emit(const CupDetailMemberTournamentAdded());
          // MyMessage myMessage =

          emailMessage.sendMessageTeamCodeMethod(
            tournament!,
            team!.data!,
            appBloc.state.user!.email,
          );
        } else {
          emit(
            const CupDetailErrorMemberTournamentAdded(
              errorMsg: 'Code team non reconnu',
            ),
          );
        }
      }
    } else {
      emit(
        const CupDetailErrorMemberTournamentAdded(errorMsg: 'Tournois full'),
      );
    }
  }

  bool findTeam(TeamDocumentSnapshot? team) => team != null;

  Future<bool> teamNameNotExist(String teamName) async =>
      teamRepository.checkNameTeam(teamName);

  bool isPlayer(RoleType roleType) => roleType == RoleType.player;

  bool isLeader(RoleType roleType) => roleType == RoleType.leader;

  bool checkStateTournament(Tournament tournament) {
    return tournament.state == TournamentState.inscriptionFermer ||
        tournament.state == TournamentState.annuler ||
        tournament.state == TournamentState.complet ||
        tournament.state == TournamentState.terminer ||
        false;
  }
}
