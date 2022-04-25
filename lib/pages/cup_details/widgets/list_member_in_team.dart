import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/cup_detail_cubit.dart';
import 'package:o_spawn_cup/pages/cup_details/cubit/show_stat_cubit.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class ListMemberInTeam extends StatelessWidget {
  const ListMemberInTeam({
    Key? key,
    required this.tournament,
    required this.indexTeams,
  }) : super(key: key);

  final Tournament tournament;
  final int indexTeams;

  @override
  Widget build(BuildContext context) {
    final showStatCubit = context.read<ShowStatCubit>();

    return BlocBuilder<ShowStatCubit, ShowStatState>(
      buildWhen: (previous, current) =>
          current is ShowStatMemberTournamentLoaded,
      builder: (context, state) {
        if (state is ShowStatMemberTournamentLoaded) {
          return ListView.builder(
            itemCount: state.listMemberTournament.length,
            shrinkWrap: true,
            itemBuilder: (context, indexMemberTournament) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (state.listMemberTournament[indexMemberTournament]
                                    .member.uid ==
                                FirebaseAuth.instance.currentUser!.uid ||
                            context.read<CupDetailCubit>().member.isAdmin)
                          SizedBox(
                            height: 20,
                            // color: Colors.green,
                            child: IconButton(
                              onPressed: () =>
                                  showStatCubit.disqualifiedMemberTournament(
                                state.listMemberTournament[
                                    indexMemberTournament],
                                showStatCubit.listTeam[indexTeams],
                              ),
                              icon: const Icon(
                                Icons.close_outlined,
                                color: Colors.red,
                              ),
                              alignment: Alignment.center,
                            ),
                          )
                        else
                          const SizedBox(
                            height: 20,
                            width: 40,
                          ),
                        Expanded(
                          flex: 3,
                          child: TextElement(
                            text: state
                                .listMemberTournament[indexMemberTournament]
                                .gamerTag,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: TextElement(
                            text: '0',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: TextElement(
                            text: '0',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: TextElement(
                            text: '0',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: DottedLine(
                        dashColor: Colors.grey,
                        lineThickness: 0.2,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }

        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
