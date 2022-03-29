import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/models/Member/member.dart' as mem;
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
  List<Team> listTeam = [];
  List<MemberTournament> _listMemberTournament = [];
  late mem.Member member;
  late Tournament tournament;
  CupDetailCubit({required this.teamRepository,required this.memberRepository,required this.appBloc}) : super(CupDetailInitial()){

    memberRepository.currentMember(appBloc.state.user.id).listen((event) {
      if(event != null) {
        print(event);
        member = event;
      }
    });
    teamRepository.listTeamStream.listen((event) {
      listTeam = event;
      emit(CupDetailListTeamChanged(listTeam: listTeam));
    });
    // memberTournamentRepository.listMemberTournamentStream.listen((event) {
    //   _listMemberTournament = event;
    // });
    teamRepository.teamCollectionReference.parent.snapshots().listen((event) {
      if(event.data != null) {
        tournament = event.data!;
        tournament.documentId = event.id;
          emit(CupDetailTournamentChanged(tournament: tournament,isClose: checkStateTournament(tournament)));
      }
    });
  }

  statePlacesRestante placesRestante(Tournament tournois, List<Team> teams){
    var places = tournois.capacity - teams.length;
    if(places > 0) {
      return statePlacesRestante.isNotFull;
    } else {
      return statePlacesRestante.isFull;
    }

  }
  addMemberTournament(String gamerTag,RoleType roleType,String teamName) async {
    TeamDocumentReference teamDocReference;
    if(roleType == RoleType.leader) {
      if(await teamRepository.checkNameTeam(teamName)) {
        teamDocReference = await teamRepository.addTeamInTournament(Team(name: teamName),);
        memberTournamentRepository = MemberTournamentRepository(memberTournamentCollectionReference: MemberTournamentCollectionReference(teamDocReference.reference));
        memberTournamentRepository.addMemberTournamentInTeam(member, gamerTag, roleType);
        emit(CupDetailMemberTournamentAdded());
      } else {
        print("Team exist");
      }

    }
    if(roleType == RoleType.player){
      var team = await teamRepository.findTeamWithCode(teamName);
      if(team != null) {
        memberTournamentRepository = MemberTournamentRepository(memberTournamentCollectionReference: MemberTournamentCollectionReference(team.reference.reference));
        memberTournamentRepository.addMemberTournamentInTeam(member, gamerTag, roleType);
        emit(CupDetailMemberTournamentAdded());
      } else {
        print("la team n'existe pas ");
      }
    }

// context.read<SignCupBloc>().add(
    //     SignCupGamerTagChanged(
    //         gamerTagController.text));
    // context.read<SignCupBloc>().add(
    //     SignCupTeamCodeChanged(
    //         teamNameController.text));
    // if (context
    //     .read<SignCupBloc>()
    //     .state
    //     .status
    //     .isValidated) {
    //   if (isPlayer(context)) {
    //     context
    //         .read<TeamFirestoreCubit>()
    //         .addMemberInTeam(
    //         tournament,
    //         teamNameController.text,
    //         gamerTagController.text);
    //   }
    //   if (isLeader(context)) {
    //     context
    //         .read<TeamFirestoreCubit>()
    //         .addNewTeam(
    //         tournament,
    //         teamNameController.text,
    //         gamerTagController.text);
    //   }
    //   context
    //       .read<SignCupBloc>()
    //       .add(const SignCupSubmitted());
    // } else {}
    //
    // afterAddMemberTournament();
  }

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
