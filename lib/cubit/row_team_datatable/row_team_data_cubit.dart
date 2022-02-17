import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/service/firebase_handler.dart';

import '../../models/Member/member.dart';
import '../../models/Team/team.dart';
import '../../models/Tournament/tournament.dart';

part 'row_team_data_state.dart';

class RowTeamDataCubit extends Cubit<RowTeamDataState> {

  RowTeamDataCubit() : super(RowTeamDataInitial(null));

  changeRowSelect(int indexSelect,Tournament tournament,Team team) async {
    if(indexSelect != state.indexSelect){
      var membersTournament = await FirebaseHandler().getMemberTournamentInTournament(tournament, team);
      List<Member?> members = [];
      for(var element in membersTournament) {
        members.add(await FirebaseHandler().getMemberInTournament(tournament, team, element));
      }

      emit(RowTeamDataSelected(indexSelect,membersTournament,members));
    } else {
      emit(RowTeamDataSelected(null, [],[]));
    }

  }
}
