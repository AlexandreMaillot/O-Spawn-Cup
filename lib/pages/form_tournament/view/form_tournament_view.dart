
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/shared/widgets/custom_app_bar.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/shared/widgets/custom_drawer.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';
import 'package:o_spawn_cup/constant.dart';



class FormTournamentView extends StatelessWidget {
  Tournament? tournament;


  FormTournamentView({Key? key,required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initGameSelect(context.read<TournamentFormBloc>(),);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      appBar: CustomAppBar(
        title: '',
      ),
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SubtitleElement(
                    text: 'CREATION DE TOURNOIS',
                    color: colorTheme,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    colorScheme: Theme.of(context)
                        .colorScheme
                        .copyWith(primary: colorTheme.withOpacity(0.7)),
                  ),
                  child:
                  FormBlocListener<TournamentFormBloc, String, String>(
                    // buildWhen: (previous, current) =>
                    // current.runtimeType == StepByStepWidgetChanged,
                    child: StepperFormBlocBuilder<TournamentFormBloc>(
                        formBloc: context.read<TournamentFormBloc>(),
                          type: StepperType.vertical,
                          onStepTapped: (tournamentForm,step) => tournamentForm?.updateCurrentStep(step),
                          physics: const ScrollPhysics(),
                          controlsBuilder: (context, onStepContinue,onStepCancel,step,tournamentForm) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                mainAxisAlignment: (step == 0)
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  if (step != 0)
                                    CustomButtonTheme(
                                      text: 'RETOUR',
                                      colorButton: Colors.white,
                                      colorText: colorBackgroundTheme,
                                      width: screenSize.width / 3,
                                      onPressedMethod: () {
                                        onStepCancel!();
                                      },
                                    ),
                                  CustomButtonTheme(
                                    text: (step < 5)
                                        ? 'VALIDER'
                                        : 'TERMINER',
                                    colorButton: colorTheme,
                                    colorText: colorBackgroundTheme,
                                    width: screenSize.width / 3,
                                    onPressedMethod: () async {
                                      onStepContinue!();
                                      if (step == tournamentForm.state.lastStep) {
                                        Navigator.of(context).push(Home.route());
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          stepsBuilder: (tournamentForm) {
                          return [
                              buildStep1(context.read<SelectGameBloc>(),tournamentForm!),
                              buildStep2(tournamentForm),
                              buildStep3(tournamentForm,),
                              buildStep4(tournamentForm,),
                              buildStep5(tournamentForm),
                              buildStep6(tournamentForm),
                            ];
                          }
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
}




