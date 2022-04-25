import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/list_member_in_team.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/row_team_stat.dart';

class TableTeamStat extends StatelessWidget {
  const TableTeamStat({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<ShowStatCubit, ShowStatState>(
        buildWhen: (previous, current) =>
            current is ShowStatTournamentLoaded ||
            current is ShowStatTeamsLoaded ||
            current is ShowStatRowSelected,
        builder: (context, state) {
          final showStatCubit = context.read<ShowStatCubit>();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: showStatCubit.listTeam.length,
            itemBuilder: (context, indexTeams) {
              return Column(
                children: [
                  RowStatTeam(
                    tournament: showStatCubit.tournament,
                    indexTeams: indexTeams,
                  ),
                  const Divider(color: Colors.grey),
                  if (showStatCubit.indexRowSelect == indexTeams)
                    ListMemberInTeam(
                      tournament: showStatCubit.tournament,
                      indexTeams: indexTeams,
                    )
                  else
                    Container(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
