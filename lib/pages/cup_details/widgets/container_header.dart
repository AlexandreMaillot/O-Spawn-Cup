import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_spawn_cup/bloc/bloc_router.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';

class ContainerHeader extends StatelessWidget {
  ContainerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<CupDetailCubit, CupDetailState>(
      buildWhen: (previous, current) => current is CupDetailTournamentChanged || current is CupDetailMemberChanged,
      builder: (context, state) {
        var cupDetailCubit = context.read<CupDetailCubit>();
        if(state.runtimeType == CupDetailTournamentChanged || state.runtimeType == CupDetailMemberChanged) {
          return Hero(
            tag: 'tagcard_cup_${cupDetailCubit.tournament!.documentId}',
            child: Container(
              height: screenSize.height * 0.25,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: (cupDetailCubit.tournament!.state == TournamentState.inscriptionOuverte)
                        ? colorOpen
                        : (cupDetailCubit.tournament!.state == TournamentState.enCours)
                        ? colorInProgress
                        : colorClose,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 10, //extend the shadow
                    offset: const Offset(
                      0, // Move to right 10  horizontally
                      -15, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.95), BlendMode.dstATop),
                  opacity: 0.31,
                  image: Image.network(cupDetailCubit.tournament!.imageUrl!).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenSize.height * 0.03,
                  ),
                  Text(
                    cupDetailCubit.tournament!.name,
                    style: TextStyle(
                        color: colorTheme,
                        fontSize: 35,
                        fontFamily: 'o_spawn_cup_font',
                        fontWeight: FontWeight.normal),
                  ),
                  SubtitleElement(
                    text: cupDetailCubit.tournament!.game.name,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon:
                              (cupDetailCubit.member.isAdmin == true)
                                  ? const Icon(Icons.close_outlined,color: Colors.white,)
                                  : Container(),
                              onPressed: () => context.read<CupDetailCubit>().closeCup(),
                            ),
                          )),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Serveur: ${cupDetailCubit.tournament!.server.name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTheme,
                              fontSize: 12,
                              fontFamily: 'o_spawn_cup_font',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon:
                            (cupDetailCubit.member.isAdmin == true)
                                ? SvgPicture.asset(
                              'assets/images/icon_edit.svg',
                              // height: 30,
                              // width: 37,
                            )
                                : Container(),
                            onPressed: () => Navigator.of(context).push(BlocRouter().cupForm(cupDetailCubit.tournament)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }

      },
    );
  }
}