import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class RowRoleType extends StatelessWidget {
  const RowRoleType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var signTournamentFormBloc = context.read<SignTournamentFormBloc>();
    return BlocBuilder(
      bloc: signTournamentFormBloc.roleSelector,
      builder: (context, state) {
        return Container(
          width: screenSize.width * 0.87,
          height: screenSize.height * 0.06,
          margin: const EdgeInsets.only(bottom: 10, top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(31),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SwitchFieldBlocBuilder(booleanFieldBloc: cupDe, body: Container()),
              Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: (isLeader(signTournamentFormBloc))
                      ? colorTheme
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(31),
                      bottomLeft: Radius.circular(31)),
                ),
                child: TextButton(
                    style: ButtonStyle(
                      // foregroundColor: MaterialStateProperty.all(Colors.red),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => signTournamentFormBloc.roleSelector
                        .changeValue(RoleType.leader),
                    child: TextElement(
                      text: "Chef d'équipe",
                    )),
              )),
              const VerticalDivider(
                color: Color(0xff696969),
                width: 1,
                thickness: 1,
                // endIndent: 1,
              ),
              Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: (isPlayer(signTournamentFormBloc))
                      ? colorTheme
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(31),
                      bottomRight: Radius.circular(31)),
                ),
                child: TextButton(
                    style: ButtonStyle(
                      // foregroundColor: MaterialStateProperty.all(Colors.red),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => signTournamentFormBloc.roleSelector
                        .changeValue(RoleType.player),
                    child: TextElement(
                      text: "Membre d'équipe",
                    )),
              )),
            ],
          ),
        );
      },
    );
  }

  bool isLeader(SignTournamentFormBloc signTournamentFormBloc) =>
      signTournamentFormBloc.roleSelector.value == RoleType.leader;
  bool isPlayer(SignTournamentFormBloc signTournamentFormBloc) =>
      signTournamentFormBloc.roleSelector.value == RoleType.player;
}
