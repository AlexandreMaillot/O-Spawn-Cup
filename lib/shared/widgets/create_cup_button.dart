import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/services/authentification.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';

class CreateCupButton extends StatelessWidget {
  const CreateCupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MemberDocumentSnapshot>(
      stream: Authentification().selectMemberConnected(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.data?.isAdmin == true) {
            return CustomButtonTheme(
              colorText: colorTextTheme,
              colorButton: Colors.white,
              text: 'CREER UN TOURNOIS',
              onPressedMethod: () => context.flow<AppState>().update(
                    (app) => app.copyWith(
                      formTournamentStatus: FormTournamentStatus.enCreation,
                    ),
                  ),
            );
          }
        }

        return Container();
      },
    );
  }
}
