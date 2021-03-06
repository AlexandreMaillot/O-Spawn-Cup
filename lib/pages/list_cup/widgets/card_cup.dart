import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/services/utils.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class CardCup extends StatelessWidget {
  final Tournament tournament;
  const CardCup({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.flow<AppState>().update(
            (app) =>
                app.copyWith(gameName: tournament.game, tournament: tournament),
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          border: Border.all(
            color: (tournament.state == TournamentState.inscriptionOuverte)
                ? colorOpen
                : (tournament.state == TournamentState.enCours)
                    ? colorInProgress
                    : colorClose,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Hero(
            tag: 'tagcard_cup_${tournament.documentId}',
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    tournament.imageUrl!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: TextElement(
                      key: const Key('DateDebutTournois'),
                      text: Utils.formatDate(tournament.dateDebutTournois),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/tournament_type_icon.svg',
                        ),
                        TextElement(
                          key: const Key('TournamentType'),
                          text: tournament.tournamentType.name,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
