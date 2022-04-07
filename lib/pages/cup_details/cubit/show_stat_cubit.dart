import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

part 'show_stat_state.dart';

class ShowStatCubit extends Cubit<ShowStatState> {
  List<Team> listTeam = [];
  bool globalStat = true;
  late Tournament tournament;
  int? indexRowSelect;
  ShowStatCubit({required this.tournament,required this.tournamentRepository, required this.teamRepository,}) : super(ShowStatInitial()){
    teamRepository.listTeamStream.listen((event) {
      listTeam = event.where((element) => !element.isDisqualified).toList();
      emit(ShowStatTeamsLoaded(listTeam: listTeam));
    });

    tournamentRepository.getTournament(tournament).listen((tournois) {
      if(tournois != null) {
        emit(ShowStatTournamentLoaded(tournament: tournois));
      }
    });
    emit(ShowStatChanged(globalStat: true));
  }
  late TeamRepository teamRepository;
  late TournamentRepository tournamentRepository;
  late MemberTournamentRepository memberTournamentRepositoryLocal;

  changeStatShow(bool isGlobal){
    globalStat = isGlobal;
    resetRowSelect();
    emit(ShowStatChanged(globalStat: isGlobal));

  }
  resetRowSelect(){
    indexRowSelect = null;
    emit(ShowStatRowSelected(rowSelect: indexRowSelect));
  }
  selectRowTeam({required int rowSelect,required MemberTournamentRepository? memberTournamentRepository}) {

    if(rowSelect == indexRowSelect){
      indexRowSelect = null;
    } else {
      indexRowSelect = rowSelect;
    }

    emit(ShowStatRowSelected(rowSelect: indexRowSelect));
    if(indexRowSelect != null && memberTournamentRepository != null) {
      memberTournamentRepositoryLocal = memberTournamentRepository;
      memberTournamentRepository.listMemberTournamentStream.listen((event) async {
        // await Future.delayed(Duration(milliseconds: 700));
        emit(ShowStatMemberTournamentLoaded(listMemberTournament: event));
      });
    }
  }

  disqualifiedMemberTournament(MemberTournament memberTournament,Team team){
    memberTournamentRepositoryLocal.deleteMemberTournament(memberTournament);
    emit(ShowStatMemberTournamentDisqualified(listMemberTournament: memberTournamentRepositoryLocal.listMemberTournament));
    if(teamRepository.disqualifiedTeamWithNoMember(team)){
      resetRowSelect();
      emit(ShowStatTeamDisqualified(listTeam: listTeam));
    }

  }
}
