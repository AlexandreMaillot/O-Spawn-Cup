import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/round_stat/round_stat_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/colum_table.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/table_team_stat.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class ListTeamWidget extends StatelessWidget {
  const ListTeamWidget({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: const SubtitleElement(
            text: 'Liste des équipes',
            color: colorTheme,
          ),
        ),
        BlocBuilder<ShowStatCubit, ShowStatState>(
          buildWhen: (previous, current) => current is ShowStatChanged,
          builder: (context, state) {
            if (state is ShowStatChanged) {
              final showStatCubit = context.read<ShowStatCubit>();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: SubtitleElement(
                      text: 'Global',
                      color: (showStatCubit.globalStat)
                          ? colorOrange
                          : Colors.white,
                    ),
                    onPressed: () =>
                        showStatCubit.changeStatShow(isGlobal: true),
                  ),
                  TextButton(
                    child: SubtitleElement(
                      text: 'Détaillé',
                      color: (!showStatCubit.globalStat)
                          ? colorOrange
                          : Colors.white,
                    ),
                    onPressed: () =>
                        showStatCubit.changeStatShow(isGlobal: false),
                  ),
                ],
              );
            }

            return const CircularProgressIndicator();
          },
        ),
        BlocBuilder<ShowStatCubit, ShowStatState>(
          buildWhen: (previous, current) =>
              current is ShowStatChanged || current is ShowStatTournamentLoaded,
          builder: (context, state) {
            final showStatCubit = context.read<ShowStatCubit>();

            return (showStatCubit.globalStat)
                ? (showStatCubit.listTeam.isNotEmpty)
                    ? Column(
                        children: [
                          const ColumnTable(),
                          TableTeamStat(tournament: showStatCubit.tournament),
                        ],
                      )
                    : const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: TextElement(
                            text: "Il n'y a encore aucune équipe inscrite",
                            color: Colors.white,
                          ),
                        ),
                      )
                : Column(
                    children: [
                      const ColumnTable(),
                      BlocBuilder<RoundStatCubit, RoundStatState>(
                        builder: (context, stateRound) {
                          return DefaultTabController(
                            length: tournament.roundNumber,
                            child: Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () => context
                                                .read<RoundStatCubit>()
                                                .changeTabContinue(),
                                            icon: const Icon(
                                              Icons.chevron_left,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                          ),
                                          TextElement(
                                            text: 'Round '
                                                '${stateRound.roundShow + 1}',
                                            color: colorTheme,
                                          ),
                                          IconButton(
                                            onPressed: () => context
                                                .read<RoundStatCubit>()
                                                .changeTabCancel(),
                                            icon: const Icon(
                                              Icons.chevron_right,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableTeamStat(tournament: tournament),
                                      const TabPageSelector(
                                        selectedColor: Color(0xffFFD739),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
