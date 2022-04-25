import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/app/app.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/shared/widgets/custom_app_bar.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/shared/widgets/custom_drawer.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';

class FormTournamentView extends StatelessWidget {
  final Tournament? tournament;

  const FormTournamentView({Key? key, required this.tournament})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flowBuilder = context.flow<AppState>();
    initGameSelect(
      context.read<TournamentFormBloc>(),
    );
    final screenSize = MediaQuery.of(context).size;
    const opacityColorTheme = 0.7;

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      appBar: const CustomAppBar(
        title: '',
      ),
      endDrawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: SubtitleElement(
                    text: 'CREATION DE TOURNOIS',
                    color: colorTheme,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: colorTheme.withOpacity(opacityColorTheme),
                        ),
                  ),
                  child: FormBlocListener<TournamentFormBloc, String, String>(
                    // buildWhen: (previous, current) =>
                    // current.runtimeType == StepByStepWidgetChanged,
                    child: StepperFormBlocBuilder<TournamentFormBloc>(
                      formBloc: context.read<TournamentFormBloc>(),
                      type: StepperType.vertical,
                      onStepTapped: (tournamentForm, step) =>
                          tournamentForm?.updateCurrentStep(step),
                      physics: const ScrollPhysics(),
                      controlsBuilder: (
                        context,
                        onStepContinue,
                        onStepCancel,
                        step,
                        tournamentForm,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: <Widget>[
                              if (step != 0)
                                CustomButtonTheme(
                                  text: 'RETOUR',
                                  colorButton: Colors.white,
                                  colorText: colorBackgroundTheme,
                                  width: screenSize.width / 3,
                                  onPressedMethod: () => onStepCancel!(),
                                ),
                              CustomButtonTheme(
                                text: (step < tournamentForm.state.lastStep)
                                    ? 'VALIDER'
                                    : 'TERMINER',
                                colorButton: colorTheme,
                                colorText: colorBackgroundTheme,
                                width: screenSize.width / 3,
                                onPressedMethod: () =>
                                    (step < tournamentForm.state.lastStep)
                                        ? onStepContinue!()
                                        : flowBuilder.update(
                                            (state) => state.copyWith(
                                              status: AppStatus.authenticated,
                                            ),
                                          ),
                              ),
                            ],
                          ),
                        );
                      },
                      stepsBuilder: (tournamentForm) =>
                          listStepWidget(context, tournamentForm),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<FormBlocStep> listStepWidget(
    BuildContext context,
    TournamentFormBloc? tournamentForm,
  ) {
    return [
      buildStep1(
        context.read<SelectGameBloc>(),
        tournamentForm!,
      ),
      buildStep2(tournamentForm),
      buildStep3(
        tournamentForm,
      ),
      buildStep4(
        tournamentForm,
      ),
      buildStep5(tournamentForm),
      buildStep6(tournamentForm),
    ];
  }
}
