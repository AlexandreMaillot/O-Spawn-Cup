import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/drawer/cubit/drawer_cubit.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';

class CreateCupButton extends StatelessWidget {
  const CreateCupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerCubit = context.read<DrawerCubit>();

    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        if (drawerCubit.member.isAdmin) {
          return CustomButtonTheme(
            key: const Key('CreateCupButton'),
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

        return Container();
      },
    );
  }
}
