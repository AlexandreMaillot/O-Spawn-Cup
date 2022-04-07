import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/repository/member_tounament_repository.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class RowStatTeam extends StatelessWidget {
  const RowStatTeam({
    Key? key,
    required this.tournament,
    required this.indexTeams,
  }) : super(key: key);

  final Tournament tournament;
  final int indexTeams;

  @override
  Widget build(BuildContext context) {
    var showStatCubit = context.read<ShowStatCubit>();
    return InkWell(
      onTap: () => showStatCubit.selectRowTeam(memberTournamentRepository: MemberTournamentRepository(memberTournamentCollectionReference: MemberTournamentCollectionReference(showStatCubit.teamRepository.getTeamDocumentReference(showStatCubit.listTeam[indexTeams])),),rowSelect: indexTeams),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(

              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  child: Transform.rotate(
                    angle: (showStatCubit.indexRowSelect == indexTeams)
                        ? 0
                        : 180 * pi / 180,
                    child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () => showStatCubit.selectRowTeam(memberTournamentRepository: MemberTournamentRepository(memberTournamentCollectionReference: MemberTournamentCollectionReference(showStatCubit.teamRepository.getTeamDocumentReference(showStatCubit.listTeam[indexTeams])),),rowSelect: indexTeams),
                        icon: SvgPicture.asset(
                          'assets/images/downArrow.svg',
                          height: 10,
                          width: 15,
                          color:
                          (showStatCubit.indexRowSelect == indexTeams)
                              ? colorTheme
                              : Colors.white,
                        )),
                  ),
                ),
                TextElement(
                  text:
                  '${indexTeams + 1}. ${showStatCubit.listTeam[indexTeams].name}',
                  color: (showStatCubit.indexRowSelect == indexTeams)
                      ? colorTheme
                      : Colors.white,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TextElement(
              text: '0',
              color:
              (showStatCubit.indexRowSelect == indexTeams)
                  ? colorTheme
                  : Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextElement(
              text: '0',
              color:
              (showStatCubit.indexRowSelect == indexTeams)
                  ? colorTheme
                  : Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextElement(
              text: '0',
              color:
              (showStatCubit.indexRowSelect == indexTeams)
                  ? colorTheme
                  : Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}