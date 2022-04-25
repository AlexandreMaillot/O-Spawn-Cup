import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/pages/form_tournament/widgets/widget_num_player_by_team.dart';

class RowNumberPlayerByTeam extends StatelessWidget {
  final InputFieldBloc<TournamentType?, Object> inputFieldBloc;

  const RowNumberPlayerByTeam({
    Key? key,
    required this.inputFieldBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: inputFieldBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listWidgetNumPlayerByTeam,
        );
      },
    );
  }
}

final List<WidgetNumPlayerByTeam> listWidgetNumPlayerByTeam = [
  WidgetNumPlayerByTeam(
    tournamentType: listTournamentType.first,
    image: 'assets/images/img_onePlayer.png',
    index: 0,
  ),
  WidgetNumPlayerByTeam(
    tournamentType: listTournamentType[1],
    image: 'assets/images/img_twoPlayer.png',
    index: 1,
  ),
  WidgetNumPlayerByTeam(
    tournamentType: listTournamentType[2],
    image: 'assets/images/img_threePlayer.png',
    index: 2,
  ),
  WidgetNumPlayerByTeam(
    tournamentType: listTournamentType[3],
    image: 'assets/images/img_fourPlayer.png',
    index: 3,
  ),
  WidgetNumPlayerByTeam(
    tournamentType: listTournamentType[4],
    image: 'assets/images/img_fivePlayer.png',
    index: 4,
  ),
];
