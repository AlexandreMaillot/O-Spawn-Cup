import 'dart:io';
import 'dart:math';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formz/formz.dart';
import 'package:o_spawn_cup/bloc/form_tournament_step_2_bloc/form_tournament_step_2_bloc.dart';
import 'package:o_spawn_cup/bloc/form_tournament_step_3_bloc/form_tournament_step_3_bloc.dart';
import 'package:o_spawn_cup/bloc/form_tournament_step_4_bloc/form_tournament_step_4_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/bloc/step_by_step_widget_bloc/step_by_step_widget_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart';
import 'package:o_spawn_cup/cubit/list_cash_prizes_cubit.dart';
import 'package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart';
import 'package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/validator/server_type.dart'
as serverTypeValidator;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';
import 'package:o_spawn_cup/services/utils.dart';
import 'package:o_spawn_cup/shared/widgets/custom_app_bar.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/shared/widgets/custom_drawer.dart';
import 'package:o_spawn_cup/shared/widgets/custom_dropdown.dart';
import 'package:o_spawn_cup/shared/widgets/custom_row_textfield_date.dart';
import 'package:o_spawn_cup/shared/widgets/custom_text_field.dart';
import 'package:o_spawn_cup/shared/widgets/game_card.dart';
import 'package:o_spawn_cup/shared/widgets/no_data.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';
import 'package:o_spawn_cup/constant.dart';



class FormTournamentView extends StatelessWidget {
  Tournament? tournament;


  FormTournamentView({Key? key,required this.tournament}) : super(key: key);
  TextEditingController daySignController = TextEditingController();
  TextEditingController monthSignController = TextEditingController();
  TextEditingController yearsSignController = TextEditingController();
  TextEditingController dayStartController = TextEditingController();
  TextEditingController monthStartController = TextEditingController();
  TextEditingController yearsStartController = TextEditingController();
  TextEditingController hoursStartController = TextEditingController();
  TextEditingController cupNameController = TextEditingController();
  TextEditingController cashPrizeController = TextEditingController();
  TextEditingController teamNumberController = TextEditingController();
  TextEditingController roundNumberController = TextEditingController();
  TextEditingController pointPerKillController = TextEditingController();
  TextEditingController pointPerRangController = TextEditingController();
  TextEditingController rangStartController = TextEditingController();

  CustomDropdown serverDropdown = CustomDropdown(
    hintText: 'SERVEUR',
    listItem: listServerTypeDropdown,
  );
  List<TextEditingController> controllersCodeGenerate = [];
  late File imageFile;

  @override
  Widget build(BuildContext context) {

    var tournamentForm = context.read<TournamentFormBloc>();
    modifCup(tournament,context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      appBar: CustomAppBar(
        title: '',
      ),
      drawer: CustomDrawer(screenSize: screenSize),
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
                                      if (step <= tournamentForm.state.lastStep) {
                                        // print(step);
                                        if(step == 0) {
                                          onStepContinue!();
                                        }
                                        if(step == 1) {
                                          onStepContinue!();
                                        }
                                        if(step == 2) {
                                          onStepContinue!();
                                        }
                                        if(step == 3) {
                                          onStepContinue!();
                                          // if(context.read<FormTournamentStep4Bloc>().state.status.isValidated){
                                            // onStepContinue!();
                                          // } else {
                                            // int? imgSelect = (context.read<SelectedImagePredefCubit>().state as SelectedImagePredefInitial).indexSelected;
                                            // context.read<FormTournamentStep4Bloc>().add(FormTournamentImageCupChanged((context.read<TakeImageGalleryCubit>().state.imageTaked != null)
                                            //     ? context.read<TakeImageGalleryCubit>().state.imageTaked!
                                            //     : imgSelect == null ? null : File(listImagePre[(context.read<SelectedImagePredefCubit>().state as SelectedImagePredefInitial).indexSelected!].image),));
                                            // if(context.read<TakeImageGalleryCubit>().state.imageTaked == null && imgSelect == null){
                                            //   context.read<SelectedImagePredefCubit>().selectImagePreDefAnimation();
                                            //   context.read<TakeImageGalleryCubit>().takeImageAnimation();
                                            // }
                                            // context.read<FormTournamentStep4Bloc>().add(const FormTournamentSubmitted4());
                                          // }
                                        }
                                        if(step == 4) {
                                          onStepContinue!();
                                        }

                                      }  else {
                                        print("ok");
                                        // if(tournament == null) {
                                        //   int indexGameSelect = (context
                                        //       .read<SelectGameBloc>()
                                        //       .state as SelectGameChanged)
                                        //       .index
                                        //       .toInt();
                                        //   FirebaseHandler().addTournamentFirebase(
                                        //     cupNameController.text,
                                        //     DateTime(int.parse(yearsSignController.text),int.parse(monthSignController.text),int.parse(daySignController.text),),
                                        //     DateTime(int.parse(yearsStartController.text),int.parse(monthStartController.text),int.parse(dayStartController.text),int.parse(hoursStartController.text.substring(0,2)),int.parse(hoursStartController.text.substring(3,5))),
                                        //     listCardGame[indexGameSelect]
                                        //         .gameName,
                                        //     serverDropdown.dropdownValue
                                        //     as ServerType,
                                        //     listTournamentType[context
                                        //         .read<WidgetNumberByPlayerBloc>()
                                        //         .indexSelected!],
                                        //     int.parse(teamNumberController.text),
                                        //     context.read<ListCashPrizesCubit>().list,
                                        //     context.read<GenerateCodeCubit>().listCode.map((e) => e.value.text).toList(),
                                        //     int.parse(roundNumberController.text),
                                        //     int.parse(pointPerKillController.text),
                                        //     int.parse(pointPerRangController.text),
                                        //     int.parse(rangStartController.text),
                                        //     (context.read<TakeImageGalleryCubit>().state.imageTaked !=null)
                                        //         ? context
                                        //         .read<TakeImageGalleryCubit>()
                                        //         .state
                                        //         .imageTaked!
                                        //         : File(listImagePre[(context
                                        //         .read<
                                        //         SelectedImagePredefCubit>()
                                        //         .state
                                        //     as SelectedImagePredefInitial)
                                        //         .indexSelected!]
                                        //         .image,
                                        //     ),
                                        //     (context.read<TakeImageGalleryCubit>().state.imageTaked == null) ? false : true,
                                        //
                                        //   );
                                        // } else {
                                        //
                                        // }

                                        // Navigator.of(context)
                                        //     .push(Home.route());
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
                              // buildStep6(currentIndex, screenSize,
                              //     controllersCodeGenerate),
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

  void msgErrorStep3(BuildContext context) {
    context.read<FormTournamentStep3Bloc>().add(FormTournamentPointPerRangChanged(int.tryParse(pointPerRangController.text)));
    context.read<FormTournamentStep3Bloc>().add(FormTournamentPointPerKillChanged(int.tryParse(pointPerKillController.text)));
    context.read<FormTournamentStep3Bloc>().add(FormTournamentStartRangChanged(int.tryParse(rangStartController.text)));
    context.read<FormTournamentStep3Bloc>().add(const FormTournamentSubmitted3());
  }

  void msgErrorStep2(BuildContext context) {
    context.read<FormTournamentStep2Bloc>().add(FormTournamentNameCupChanged(cupNameController.text));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentNumberRoundChanged(int.tryParse(roundNumberController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentDaySignChanged(int.tryParse(daySignController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentMonthSignChanged(int.tryParse(monthSignController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentYearsSignChanged(int.tryParse(yearsSignController.text)));

    context.read<FormTournamentStep2Bloc>().add(FormTournamentDayStartChanged(int.tryParse(dayStartController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentMonthStartChanged(int.tryParse(monthStartController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentYearsStartChanged(int.tryParse(yearsStartController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentHoursStartChanged(hoursStartController.text));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentNumberTeamChanged(int.tryParse(teamNumberController.text)));
    context.read<FormTournamentStep2Bloc>().add(FormTournamentServerTypeChanged(serverDropdown.dropdownValue.toString()));
    if(context.read<WidgetNumberByPlayerBloc>().indexSelected == null){
      context.read<WidgetNumberByPlayerBloc>().add(WidgetNumberByPlayerAnimating());
    }
    context.read<FormTournamentStep2Bloc>().add(const FormTournamentSubmitted2());
  }


  Step buildStep6(int currentIndex, Size screenSize,
      List<TextEditingController> controllersCodeGenerate) {
    String beforeCode = DateTime.now().millisecond.toString() +
        DateTime.now().microsecond.toString();
    return Step(
      state: currentIndex > 5 ? StepState.complete : StepState.disabled,
      isActive: currentIndex >= 5,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextElement(
            text: 'Identifiants',
            color: colorTheme,
          )
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: (roundNumberController.text != '')
                  ? int.parse(roundNumberController.text)
                  : 0,
              itemBuilder: (context, index) {
                return BlocBuilder<GenerateCodeCubit, GenerateCodeState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CustomTextField(
                        textInputAction: TextInputAction.next,
                        // paddingBottom: 10,
                        screenSize: screenSize,
                        text: 'CODE ${index + 1}',
                        controller:
                        context.read<GenerateCodeCubit>().listCode[index],
                        typeTextField: TextInputType.text,
                        textAlign: TextAlign.center,
                        suffixIcon: const Icon(Icons.refresh),
                        onPressIconSuffix: () {
                          context
                              .read<GenerateCodeCubit>()
                              .listCode[index]
                              .text =
                              context
                                  .read<GenerateCodeCubit>()
                                  .generateCode(beforeCode, 5);
                        },
                      ),
                    );
                  },
                );
              })
        ],
      ),
    );
  }







  Future<void> modifCup(Tournament? tournament,BuildContext context) async {
    if(tournament != null){
      int indexGame = listCardGame.indexWhere((element) => element.gameName == tournament.game);
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        // if(pageController.hasClients){
        //   context.read<SelectGameBloc>().add(SelectGameChange(indexSelect: indexGame.toDouble()));
        //   pageController.jumpToPage(indexGame);
        // }
      });
      String daySign = tournament.dateDebutInscription!.day.toString();
      String monthSign = tournament.dateDebutInscription!.month.toString();
      String yearsSign = tournament.dateDebutInscription!.year.toString();
      daySignController.text = (daySign.length == 1) ? '0' + daySign : daySign;
      monthSignController.text = (monthSign.length == 1) ? '0' + monthSign : monthSign;
      yearsSignController.text = yearsSign;

      String dayStart = tournament.dateDebutTournois!.day.toString();
      String monthStart = tournament.dateDebutTournois!.month.toString();
      String yearsStart = tournament.dateDebutTournois!.year.toString();

      dayStartController.text = (dayStart.length == 1) ? '0' + dayStart : dayStart;
      monthStartController.text = (monthStart.length == 1) ? '0' + monthStart : monthStart;
      yearsStartController.text = yearsStart;

      String hoursStart = tournament.dateDebutTournois!.hour.toString();
      String minutesStart = tournament.dateDebutTournois!.minute.toString();
      hoursStartController.text = ((hoursStart.length == 1) ? '0' + hoursStart : hoursStart) + ':' + ((minutesStart.length == 1) ? '0' + minutesStart : minutesStart);
      cupNameController.text = tournament.name;
      // cashPrizeController = TextEditingController();
      int indexPlayerBy = listTournamentType.indexWhere((element) => element.capacityTeam == tournament.tournamentType.capacityTeam);
      context.read<WidgetNumberByPlayerBloc>().add(WidgetNumberByPlayerChanging(indexSelect: indexPlayerBy));
      context.read<FormTournamentStep2Bloc>().add(FormTournamentPlayerByTeamChanged(indexPlayerBy));
      serverDropdown.dropdownValue = tournament.server;
      teamNumberController.text = tournament.capacity.toString();
      roundNumberController.text = tournament.roundNumber.toString();
      msgErrorStep2(context);
      context.read<GenerateCodeCubit>().numRoundChange(tournament.roundNumber);
      pointPerKillController.text = tournament.killPointTournament.toString();
      pointPerRangController.text = tournament.pointPerRangTournament.toString();
      rangStartController.text = tournament.rangStartTournament.toString();
      msgErrorStep3(context);

      tournament.cashPrize.forEach((element) {
        context.read<ListCashPrizesCubit>().addCashPrize(element);
      });
      tournament.listCodesGames.asMap().forEach((key,element) {
        context.read<GenerateCodeCubit>().listCode[key].text = element;
      });
      if(tournament.imageName != null) {
        File fileCup = await Utils().downloadFileImage(tournament.imageName);
        context.read<TakeImageGalleryCubit>().loadPicture(fileCup.path);
        context.read<SelectedImagePredefCubit>().clearImgSelect();
        context.read<FormTournamentStep4Bloc>().add(FormTournamentImageCupChanged(fileCup));
      }

    }
  }
}




