import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

part 'show_stat_state.dart';

class ShowStatCubit extends Cubit<ShowStatState> {
  List<Team> listTeam = [];
  bool globalStat = true;
  late Tournament tournament;
  int? indexRowSelect;
  ShowStatCubit({
    required this.tournament,
    required this.tournamentRepository,
    required this.teamRepository,
  }) : super(ShowStatInitial()) {
    teamRepository.listTeamStream.listen((event) {
      listTeam = event.where((element) => !element.isDisqualified).toList();
      emit(ShowStatTeamsLoaded(listTeam: listTeam));
    });

    tournamentRepository.getTournament(tournament).listen((tournois) {
      if (tournois != null) {
        emit(ShowStatTournamentLoaded(tournament: tournois));
      }
    });
    emit(const ShowStatChanged(globalStat: true));
  }
  late TeamRepository teamRepository;
  late TournamentRepository tournamentRepository;
  late MemberTournamentRepository memberTournamentRepositoryLocal;

  void changeStatShow({required bool isGlobal}) {
    globalStat = isGlobal;
    resetRowSelect();
    emit(ShowStatChanged(globalStat: isGlobal));
  }

  void resetRowSelect() {
    indexRowSelect = null;
    emit(ShowStatRowSelected(rowSelect: indexRowSelect));
  }

  void selectRowTeam({
    required int rowSelect,
    required MemberTournamentRepository? memberTournamentRepository,
  }) {
    indexRowSelect = rowSelect == indexRowSelect ? null : rowSelect;

    emit(ShowStatRowSelected(rowSelect: indexRowSelect));
    if (indexRowSelect != null && memberTournamentRepository != null) {
      memberTournamentRepositoryLocal = memberTournamentRepository;
      memberTournamentRepository.listMemberTournamentStream
          .listen((event) async {
        emit(ShowStatMemberTournamentLoaded(listMemberTournament: event));
      });
    }
  }

  void disqualifiedMemberTournament(
    MemberTournament memberTournament,
    Team team,
  ) {
    memberTournamentRepositoryLocal.deleteMemberTournament(memberTournament);
    emit(
      ShowStatMemberTournamentDisqualified(
        listMemberTournament:
            memberTournamentRepositoryLocal.listMemberTournament,
      ),
    );
    if (teamRepository.disqualifiedTeamWithNoMember(team).isDisqualified) {
      resetRowSelect();
      emit(ShowStatTeamDisqualified(listTeam: listTeam));
    }
  }
}
