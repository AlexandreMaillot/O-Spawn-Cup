import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/row_member_leader/row_member_leader_cubit.dart';
import 'package:o_spawn_cup/cubit/team_firestore/team_firestore_cubit.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/row_role_type.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/text_field_gamer_tag.dart';
import 'package:o_spawn_cup/pages/cup_details/widgets/text_field_team_name.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/shared/widgets/custom_text_field.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';

class SignTournamentForm extends StatelessWidget {
  const SignTournamentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signTournamentFormBloc = context.read<SignTournamentFormBloc>();
    return Column(
      children: [
        SubtitleElement(
          text: 'Inscription au tournois',
          color: colorTheme,
        ),
        TextFieldGamerTag(signTournamentFormBloc: signTournamentFormBloc),
        Text(
          '*Votre pseudo in game',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: colorTheme,
              fontSize: 7,
              fontFamily: 'o_spawn_cup_font',
              fontWeight: FontWeight.normal),
        ),
        const RowRoleType(),
        BlocBuilder(
          bloc: signTournamentFormBloc.roleSelector,
          builder: (context, state) {
            return Column(
              children: [
                TextFieldTeamName(
                  signTournamentFormBloc: signTournamentFormBloc,
                  text: (isPlayer(signTournamentFormBloc))
                      ? "Code d'équipe"
                      : "Nom d'équipe",
                ),
                (isPlayer(signTournamentFormBloc))
                    ? Text(
                  "*Entrez le code d'équipe reçu par mail si vous êtes membre de l'équipe.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorTheme,
                      fontSize: 7,
                      fontFamily: 'o_spawn_cup_font',
                      fontWeight: FontWeight.normal),
                )
                    : Container(),
              ],
            );
          },
        ),


        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FormBlocListener<SignTournamentFormBloc, String,String>(
            onFailure: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(state.failureResponse ?? 'Erreur...'),
                duration: const Duration(seconds: 2),
              ));
            },
              onSuccess: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.successResponse ?? 'Inscription reussi !'),
                  duration: const Duration(seconds: 2),
                ));
              },
              child: CustomButtonTheme(
                colorButton: colorTheme,
                colorText: colorBackgroundTheme,
                text: 'Confirmation',
                onPressedMethod: () => signTournamentFormBloc.submit(),
              )),
        )
      ],
    );
  }

  bool isPlayer(SignTournamentFormBloc signTournamentFormBloc) =>
      signTournamentFormBloc.roleSelector.value == RoleType.player;
}
