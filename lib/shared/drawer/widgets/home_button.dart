import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonTheme(
      colorText: colorTextTheme,
      colorButton: Colors.white,
      text: 'ACCUEIL',
      onPressedMethod: () => context.flow<AppState>().update(
            (state) => state.copyWith(
              status: AppStatus.authenticated,
              user: state.user,
            ),
          ),
    );
  }
}
