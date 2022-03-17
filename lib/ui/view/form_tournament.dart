import "dart:io";
import "dart:math";

import "package:animated_widgets/animated_widgets.dart";
import "package:dotted_border/dotted_border.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:formz/formz.dart";
import "package:o_spawn_cup/bloc/form_tournament_step_3_bloc/form_tournament_step_3_bloc.dart";
import "package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart";
import "package:o_spawn_cup/bloc/step_by_step_widget_bloc/step_by_step_widget_bloc.dart";
import "package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart";
import "package:o_spawn_cup/cubit/generate_code_cubit/generate_code_cubit.dart";
import "package:o_spawn_cup/cubit/list_cash_prizes_cubit.dart";
import "package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart";
import "package:o_spawn_cup/cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart";
import "package:o_spawn_cup/cubit/take_image_gallery/take_image_gallery_cubit.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:o_spawn_cup/models/make_it_responsive.dart";
import "package:o_spawn_cup/models/server_type.dart";
import "package:o_spawn_cup/models/validator/server_type.dart"
    as serverTypeValidator;
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;
import "package:o_spawn_cup/service/firebase_handler.dart";
import "package:o_spawn_cup/service/utils.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_dropdown.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_row_textfield_date.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/game_card.dart";
import 'package:o_spawn_cup/ui/CustomsWidgets/no_data.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/subtiltle_element.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/text_element.dart";
import "package:o_spawn_cup/constant.dart";

import "../../bloc/form_tournament_step_2_bloc/form_tournament_step_2_bloc.dart";
import "../../bloc/form_tournament_step_4_bloc/form_tournament_step_4_bloc.dart";
import "../../cubit/selected_image_predef_cubit/selected_image_predef_cubit.dart";

class FormTournament extends StatelessWidget {
  Tournament? tournament;
  FormTournament({
    Key? key,
    required this.tournament
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SelectGameBloc(listGameName: listCardGame, initialIndex: 1.0),
        ),
        BlocProvider(
          create: (_) =>
              StepByStepWidgetBloc(initialIndex: 0, initialIndexMax: 5),
        ),
        BlocProvider(
          create: (_) => WidgetNumberByPlayerBloc(),
        ),
        BlocProvider(
          create: (_) => SelectedImagePredefCubit(),
        ),
        BlocProvider(
          create: (_) => GenerateCodeCubit(),
        ),
        BlocProvider(
          create: (_) => TakeImageGalleryCubit(),
        ),
        BlocProvider(
          create: (_) => FormTournamentStep2Bloc(),
        ),
        BlocProvider(
          create: (_) => FormTournamentStep3Bloc(),
        ),
        BlocProvider(
          create: (_) => FormTournamentStep4Bloc(),
        ),
        BlocProvider(
          create: (_) => ListCashPrizesCubit(listCashPrizes: []),
        ),
      ],
      child: FormTournamentView(tournament: tournament),
    );
  }
}

class FormTournamentView extends StatelessWidget {
  Tournament? tournament;
  PageController pageController = PageController(viewportFraction: 0.5, initialPage: 1,keepPage: false);

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
    hintText: "SERVEUR",
    listItem: listServerTypeDropdown,
  );
  List<TextEditingController> controllersCodeGenerate = [];
  late File imageFile;
  FocusNode dayFocus = FocusNode();
  FocusNode monthFocus = FocusNode();
  FocusNode yearsFocus = FocusNode();
  FocusNode dayStartFocus = FocusNode();
  FocusNode monthStartFocus = FocusNode();
  FocusNode yearsStartFocus = FocusNode();
  FocusNode tournamentFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      context
          .read<SelectGameBloc>()
          .add(SelectGameChange(indexSelect: pageController.page!));
    });
    modifCup(tournament,context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      appBar: CustomAppBar(
        title: "",
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
                    text: "CREATION DE TOURNOIS",
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
                      BlocBuilder<StepByStepWidgetBloc, StepByStepWidgetState>(
                    buildWhen: (previous, current) =>
                        current.runtimeType == StepByStepWidgetChanged,
                    builder: (context, state) {
                      final currentIndex = context.select(
                          (StepByStepWidgetBloc bloc) =>
                              bloc.state.indexCurrent);
                      return Stepper(
                          controlsBuilder: (context, controls) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                mainAxisAlignment: (currentIndex == 0)
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  if (currentIndex != 0)
                                    CustomButtonTheme(
                                      text: "RETOUR",
                                      screenSize: screenSize,
                                      colorButton: Colors.white,
                                      colorText: colorBackgroundTheme,
                                      width: screenSize.width / 3,
                                      onPressedMethod: () {
                                        controls.onStepCancel!();
                                      },
                                    ),
                                  CustomButtonTheme(
                                    text: (currentIndex < 5)
                                        ? "VALIDER"
                                        : "TERMINER",
                                    screenSize: screenSize,
                                    colorButton: colorTheme,
                                    colorText: colorBackgroundTheme,
                                    width: screenSize.width / 3,
                                    onPressedMethod: () async {
                                      if (currentIndex < context.read<StepByStepWidgetBloc>().indexMax) {
                                        if(currentIndex == 0) {
                                          controls.onStepContinue!();
                                        }
                                        if(currentIndex == 1) {

                                          // print("playerby: ${context.read<FormTournamentStep2Bloc>().state.playerByTeam.valid}");
                                          // print("name: ${context.read<FormTournamentStep2Bloc>().state.nameCup.valid}");
                                          // print("years: ${context.read<FormTournamentStep2Bloc>().state.yearsSign.valid}");
                                          // print("day: ${context.read<FormTournamentStep2Bloc>().state.daySign.valid}");
                                          // print("month: ${context.read<FormTournamentStep2Bloc>().state.monthSign.valid}");
                                          // print("numberteam: ${context.read<FormTournamentStep2Bloc>().state.numberTeam.valid}");
                                          // print("server: ${context.read<FormTournamentStep2Bloc>().state.serverType.valid}");

                                          if(context.read<FormTournamentStep2Bloc>().state.status.isValidated){
                                            controls.onStepContinue!();
                                          } else {

                                            msgErrorStep2(context);
                                          }
                                        }
                                        if(currentIndex == 2) {
                                          if(context.read<FormTournamentStep3Bloc>().state.status.isValidated){
                                            controls.onStepContinue!();
                                          } else {

                                            msgErrorStep3(context);
                                          }
                                        }
                                        if(currentIndex == 3) {
                                          if(context.read<FormTournamentStep4Bloc>().state.status.isValidated){
                                            controls.onStepContinue!();
                                          } else {
                                            int? imgSelect = (context.read<SelectedImagePredefCubit>().state as SelectedImagePredefInitial).indexSelected;
                                            context.read<FormTournamentStep4Bloc>().add(FormTournamentImageCupChanged((context.read<TakeImageGalleryCubit>().state.imageTaked != null)
                                                ? context.read<TakeImageGalleryCubit>().state.imageTaked!
                                                : imgSelect == null ? null : File(listImagePre[(context.read<SelectedImagePredefCubit>().state as SelectedImagePredefInitial).indexSelected!].image),));
                                            if(context.read<TakeImageGalleryCubit>().state.imageTaked == null && imgSelect == null){
                                              context.read<SelectedImagePredefCubit>().selectImagePreDefAnimation();
                                              context.read<TakeImageGalleryCubit>().takeImageAnimation();
                                            }
                                            context.read<FormTournamentStep4Bloc>().add(const FormTournamentSubmitted4());
                                          }
                                        }
                                        if(currentIndex == 4) {
                                          controls.onStepContinue!();
                                        }

                                      }  else {
                                        if(tournament == null) {
                                          int indexGameSelect = (context
                                              .read<SelectGameBloc>()
                                              .state as SelectGameChanged)
                                              .index
                                              .toInt();
                                          FirebaseHandler().addTournamentFirebase(
                                            cupNameController.text,
                                            DateTime(int.parse(yearsSignController.text),int.parse(monthSignController.text),int.parse(daySignController.text),),
                                            DateTime(int.parse(yearsStartController.text),int.parse(monthStartController.text),int.parse(dayStartController.text),int.parse(hoursStartController.text.substring(0,2)),int.parse(hoursStartController.text.substring(3,5))),
                                            listCardGame[indexGameSelect]
                                                .gameName,
                                            serverDropdown.dropdownValue
                                            as ServerType,
                                            listTournamentType[context
                                                .read<WidgetNumberByPlayerBloc>()
                                                .indexSelected!],
                                            int.parse(teamNumberController.text),
                                            context.read<ListCashPrizesCubit>().list,
                                            int.parse(roundNumberController.text),
                                            int.parse(pointPerKillController.text),
                                            int.parse(pointPerRangController.text),
                                            int.parse(rangStartController.text),
                                            (context.read<TakeImageGalleryCubit>().state.imageTaked !=null)
                                                ? context
                                                .read<TakeImageGalleryCubit>()
                                                .state
                                                .imageTaked!
                                                : File(listImagePre[(context
                                                .read<
                                                SelectedImagePredefCubit>()
                                                .state
                                            as SelectedImagePredefInitial)
                                                .indexSelected!]
                                                .image,
                                            ),
                                            (context.read<TakeImageGalleryCubit>().state.imageTaked == null) ? false : true,
                                          );
                                        } else {

                                        }

                                        Navigator.of(context)
                                            .pushNamed("/home");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          type: StepperType.vertical,
                          onStepTapped: (step) => context
                              .read<StepByStepWidgetBloc>()
                              .add(StepByStepWidgetByTap(indexTap: step)),
                          onStepContinue: () => context
                              .read<StepByStepWidgetBloc>()
                              .add(StepByStepWidgetContinue()),
                          onStepCancel: () => context
                              .read<StepByStepWidgetBloc>()
                              .add(StepByStepWidgetCancel()),
                          physics: const ScrollPhysics(),
                          currentStep: currentIndex,
                          steps: [
                            buildStep1(currentIndex, screenSize),
                            buildStep2(currentIndex, screenSize),
                            buildStep3(currentIndex, screenSize),
                            buildStep4(currentIndex, screenSize,context),
                            buildStep5(currentIndex, screenSize),
                            buildStep6(currentIndex, screenSize,
                                controllersCodeGenerate),
                          ]);
                    },
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
            text: "Identifiants",
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
              itemCount: (roundNumberController.text != "")
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
                        text: "CODE ${index + 1}",
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
  Step buildStep5(int currentIndex, Size screenSize) {

    return Step(
      state: currentIndex > 4 ? StepState.complete : StepState.disabled,
      isActive: currentIndex >= 4,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextElement(
            text: "Cash prizes",
            color: colorTheme,
          )
        ],
      ),
      content: BlocBuilder<ListCashPrizesCubit, ListCashPrizesState>(
      builder: (context, state) {
        return Column(
          children: [
            (context.read<ListCashPrizesCubit>().list.isEmpty)
                ? TextElement(text: "Il n'y a aucun cash prizes !",color: Colors.white,)
                : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              itemCount: context.read<ListCashPrizesCubit>().list.length,
              itemBuilder: (context, index) {


                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextElement(text: (index + 1).toString()+ " ",color: Colors.white,),
                    const Expanded(
                      child: DottedLine(
                        dashColor: Colors.white,
                        lineThickness: 0.3,
                      ),
                    ),
                    InkWell(
                        onTap: () => _displayTextInputDialog(context,index),
                        child: TextElement(text: context.read<ListCashPrizesCubit>().list[index].toString() ,color: Colors.white)),
                    IconButton(onPressed: () => context.read<ListCashPrizesCubit>().deleteCashPrizes(index),icon: const Icon(Icons.delete_forever,color: Colors.red,)),
                  ],
                );

              },
            ),
            TextButton.icon(onPressed: () => _displayTextInputDialog(context,null), icon: const Icon(Icons.add_circle,color: Colors.white), label: TextElement(text: "Ajouter un lot",color: colorTheme,))
          ],
        );
      },
    ),
    );
  }
  Future<void> _displayTextInputDialog(BuildContext contextLocal,int? index) async {
    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: contextLocal,
        builder: (context) {
          _textFieldController.text = (index != null) ? contextLocal.read<ListCashPrizesCubit>().list[index] : "";
          return AlertDialog(
            title: TextElement(text: "Ajouter un cash prize"),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Pull o-spawn,discord nitro,Skin fornite..."),
            ),
            actions: <Widget>[
              TextButton(
                child: TextElement(text: "Annuler"),
                onPressed: () {
                    Navigator.pop(context);
                },
              ),
              TextButton(
                child: TextElement(text: "Valider",color: colorOrange,),
                onPressed: () {
                  if(index != null){
                    contextLocal.read<ListCashPrizesCubit>().modifCashPrize(index,_textFieldController.text);
                  } else {
                    contextLocal.read<ListCashPrizesCubit>().addCashPrize(_textFieldController.text);
                  }

                    Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  Step buildStep4(int currentIndex, Size screenSize,BuildContext context) {
    return Step(
        state: currentIndex > 3 ? StepState.complete : StepState.disabled,
        isActive: currentIndex >= 3,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextElement(
              text: "Personnalisation",
              color: colorTheme,
            )
          ],
        ),
        content: Column(
          children: [
            const WidgetChooseImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextElement(
                text: "ou",
                color: Colors.white,
              ),
            ),
            TextElement(
              text: "IMAGES PRE-DEFINIES",
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BlocBuilder<SelectGameBloc, SelectGameState>(
                builder: (context, state) {
                  //
                  return GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: context.select(
                        (SelectGameBloc bloc) => bloc.filteredImageByGame()),
                  );
                },
              ),
            ),
          ],
        ));
  }

  Step buildStep3(int currentIndex, Size screenSize) {
    return Step(
        state: currentIndex > 2 ? StepState.complete : StepState.disabled,
        isActive: currentIndex >= 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextElement(
              text: "Points",
              color: colorTheme,
            )
          ],
        ),
        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<FormTournamentStep3Bloc, FormTournamentStep3State>(
              builder: (context, state) {
                return CustomTextField(
                  textInputAction: TextInputAction.next,
                screenSize: screenSize,
                text: "POINT PAR KILL",
                  paddingBottom: 10,
                controller: pointPerKillController,
                typeTextField: TextInputType.number,
                onChanged: (context, value) => context.read<FormTournamentStep3Bloc>().add(FormTournamentPointPerKillChanged(int.tryParse(value))),
                errorText: state.pointPerKill.invalid
                    ? "Le nombre de point par kill doit être renseigné !"
                    : null,
              );
  },
),
              BlocBuilder<FormTournamentStep3Bloc, FormTournamentStep3State>(
              builder: (context, state) {
                return CustomTextField(
                  textInputAction: TextInputAction.next,
                screenSize: screenSize,
                  paddingBottom: 10,
                text: "POINT PAR RANG",
                controller: pointPerRangController,
                typeTextField: TextInputType.number,
                onChanged: (context, value) => context.read<FormTournamentStep3Bloc>().add(FormTournamentPointPerRangChanged(int.tryParse(value))),
                errorText: state.pointPerRang.invalid
                    ? "Le nombre de point par kill doit être renseigné !"
                    : null,
              );
  },
),
              BlocBuilder<FormTournamentStep3Bloc, FormTournamentStep3State>(
              builder: (context, state) {
                return CustomTextField(
                screenSize: screenSize,
                  paddingBottom: 10,
                text: "RANG DEBUT DU DECOMPTE",
                controller: rangStartController,
                typeTextField: TextInputType.number,
                onChanged: (context, value) => context.read<FormTournamentStep3Bloc>().add(FormTournamentStartRangChanged(int.tryParse(value))),
                errorText: state.startRang.invalid
                    ? "Le nombre de point par kill doit être renseigné !"
                    : null,
              );
  },
),
            ],
          ),
        ));
  }

  Step buildStep2(int currentIndex, Size screenSize) {
    return Step(
        state: currentIndex > 1 ? StepState.complete : StepState.disabled,
        isActive: currentIndex >= 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextElement(
              text: "Informations",
              color: colorTheme,
            )
          ],
        ),
        content: SizedBox(
          // height: screenSize.height * 0.48,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
                builder: (context, state) {
                  return CustomTextField(
                    textInputAction: TextInputAction.next,
                    paddingBottom: 10,
                    screenSize: screenSize,
                    text: "NOM DU TOURNOIS",
                    controller: cupNameController,
                    onChanged: (context, value) => context
                        .read<FormTournamentStep2Bloc>()
                        .add(FormTournamentNameCupChanged(value)),
                    errorText: state.nameCup.invalid
                        ? "Le nom du tournois doit être renseigné !"
                        : null,
                  );
                },
              ),
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
                builder: (context, state) {
                  return CustomTextField(
                    paddingBottom: 10,
                    textInputAction: TextInputAction.next,
                    screenSize: screenSize,
                    text: "NOMBRE DE GAME(S)",
                    controller: roundNumberController,
                    typeTextField: TextInputType.number,
                    errorText: state.numberRound.invalid
                        ? "Le nombre de round doit être supérieur à zéro !"
                        : null,
                    onChanged: (context, value) {
                      context
                          .read<FormTournamentStep2Bloc>()
                          .add(FormTournamentNumberRoundChanged(int.tryParse(value)));
                      if (value != "") {
                        int? numberRound = int.parse(value);
                        context
                            .read<GenerateCodeCubit>()
                            .numRoundChange(numberRound);
                      }
                    },
                  );
                },
              ),
              Text(
                "Date début des inscriptions",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: colorTheme,
                    fontSize: 10,
                    fontFamily: "o_spawn_cup_font",
                    fontWeight: FontWeight.normal),
              ),
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
              builder: (context, state) {
                return RowTextfieldDate(
                  paddingBottom: 10,
                  paddingTop: 5,
                  monthFocus: monthFocus,
                  dayFocus: dayFocus,
                  dayController: daySignController,
                  yearsFocus: yearsFocus,
                  monthController: monthSignController,
                  yearsController: yearsSignController,
                  onChangedDay: (context,value) => context.read<FormTournamentStep2Bloc>().add(FormTournamentDaySignChanged(value)),
                  onChangedMonth: (context,value) => context.read<FormTournamentStep2Bloc>().add(FormTournamentMonthSignChanged(value)),
                  onChangedYears: (context,value) => context.read<FormTournamentStep2Bloc>().add(FormTournamentYearsSignChanged(value)),
                  screenSize: screenSize,
                  dateValide:  context.read<FormTournamentStep2Bloc>().state.daySign.valid && context.read<FormTournamentStep2Bloc>().state.monthSign.valid &&  context.read<FormTournamentStep2Bloc>().state.yearsSign.valid,
                );
                },
              ),
              Text(
                "Date début du tournois",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: colorTheme,
                    fontSize: 10,
                    fontFamily: "o_spawn_cup_font",
                    fontWeight: FontWeight.normal),
              ),
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
                builder: (context, state) {
                  return RowTextfieldDate(
                    paddingBottom: 10,
                    paddingTop: 5,
                    monthFocus: monthStartFocus,
                    dayFocus: dayStartFocus,
                    dayController: dayStartController,
                    yearsFocus: yearsStartFocus,
                    monthController: monthStartController,
                    yearsController: yearsStartController,
                    onChangedDay: (context,value) => context.read<FormTournamentStep2Bloc>().add(FormTournamentDayStartChanged(value)),
                    onChangedMonth: (context,value) => context.read<FormTournamentStep2Bloc>().add(FormTournamentMonthStartChanged(value)),
                    onChangedYears: (context,value) => context.read<FormTournamentStep2Bloc>().add(FormTournamentYearsStartChanged(value)),
                    screenSize: screenSize,
                    dateValide:  context.read<FormTournamentStep2Bloc>().state.daySign.valid && context.read<FormTournamentStep2Bloc>().state.monthSign.valid && context.read<FormTournamentStep2Bloc>().state.yearsSign.valid,
                  );
                },
              ),
              Text(
                "Heure début du tournois",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: colorTheme,
                    fontSize: 10,
                    fontFamily: "o_spawn_cup_font",
                    fontWeight: FontWeight.normal),
              ),
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
                builder: (context, state) {
                  return CustomTextField(
                    screenSize: screenSize,
                    paddingBottom: 10,
                    paddingTop: 5,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.left,
                    widthTextfield: screenSize.width * 0.4,
                    text: "Heure",
                    suffixIcon: const Icon(Icons.access_time_outlined),
                    controller: hoursStartController,
                    onChanged: (context, value) => context
                        .read<FormTournamentStep2Bloc>()
                        .add(FormTournamentHoursStartChanged(value)),
                    typeTextField: TextInputType.datetime,
                    errorText: state.hoursStart.invalid
                        ? "L'heure n'est pas valide !"
                        : null,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
              builder: (context, state) {
                return const RowWidgetNumByPlayer();
              },
),
              ),
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
                builder: (context, state) {
                  return CustomTextField(
                    paddingTop: 10,
                    paddingBottom: 10,
                    screenSize: screenSize,
                    textInputAction: TextInputAction.next,
                    text: "NOMBRE D'EQUIPES",
                    controller: teamNumberController,
                    onChanged: (context, value) => context
                        .read<FormTournamentStep2Bloc>()
                        .add(FormTournamentNumberTeamChanged(int.tryParse(value))),
                    typeTextField: TextInputType.number,
                    errorText: state.numberTeam.invalid
                        ? "Le nombre d'équipe doit être supérieur à 2 !"
                        : null,
                  );
                },
              ),
              BlocBuilder<FormTournamentStep2Bloc, FormTournamentStep2State>(
                  builder: (context, state) {
                serverDropdown.onChanged = (context, data) {
                  context
                      .read<FormTournamentStep2Bloc>()
                      .add(FormTournamentServerTypeChanged(data.toString()));
                };
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: [
                      serverDropdown,
                      state.serverType.invalid
                          ? Padding(
                              padding: const EdgeInsets.only(top: 6.0, left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Un type de serveur doit être sélectionné !",
                                    style: TextStyle(
                                      color: Color(0xffd22f2f),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              }),
            ],
          ),
        ));
  }

  Step buildStep1(int currentIndex, Size screenSize) {
    return Step(
      state: currentIndex > 0 ? StepState.complete : StepState.disabled,
      isActive: currentIndex >= 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextElement(
            text: "Choix du jeu",
            color: colorTheme,
          )
        ],
      ),
      content: BlocBuilder<SelectGameBloc, SelectGameState>(
        builder: (context, state) {
          if(state.runtimeType == SelectGameNoData) {
            return NoData(string: "Aucun jeu disponible..");
          } else {
            final indexSelect = context.select((SelectGameBloc bloc) => (bloc.state as SelectGameChanged).index);
            return Container(
              color: colorBackgroundTheme,
              height: screenSize.height / 5,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  itemCount: listCardGame.length,
                  itemBuilder: (context, position) {
                    if (position == indexSelect) {
                      return Transform.scale(
                        scale: 1,
                        child: GameCard(
                          position,
                          form: true,
                        ),
                      );
                    } else if (position < indexSelect) {
                      return Transform.scale(
                        scale: max(1 - (indexSelect - position), 0.75),
                        child: GameCard(
                          position,
                          form: true,
                        ),
                      );
                    } else {
                      return Transform.scale(
                        scale: max(1 - (position - indexSelect), 0.75),
                        child: GameCard(
                          position,
                          form: true,
                        ),
                      );
                    }
                  }),
            );
          }

        },
      ),
    );
  }

  Future<void> modifCup(Tournament? tournament,BuildContext context) async {
    if(tournament != null){
      int indexGame = listCardGame.indexWhere((element) => element.gameName == tournament.game);
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if(pageController.hasClients){
          context.read<SelectGameBloc>().add(SelectGameChange(indexSelect: indexGame.toDouble()));
          pageController.jumpToPage(indexGame);
        }
      });
      String daySign = tournament.dateDebutInscription!.day.toString();
      String monthSign = tournament.dateDebutInscription!.month.toString();
      String yearsSign = tournament.dateDebutInscription!.year.toString();
      daySignController.text = (daySign.length == 1) ? "0" + daySign : daySign;
      monthSignController.text = (monthSign.length == 1) ? "0" + monthSign : monthSign;
      yearsSignController.text = yearsSign;

      String dayStart = tournament.dateDebutTournois!.day.toString();
      String monthStart = tournament.dateDebutTournois!.month.toString();
      String yearsStart = tournament.dateDebutTournois!.year.toString();

      dayStartController.text = (dayStart.length == 1) ? "0" + dayStart : dayStart;
      monthStartController.text = (monthStart.length == 1) ? "0" + monthStart : monthStart;
      yearsStartController.text = yearsStart;

      String hoursStart = tournament.dateDebutTournois!.hour.toString();
      String minutesStart = tournament.dateDebutTournois!.minute.toString();
      hoursStartController.text = ((hoursStart.length == 1) ? "0" + hoursStart : hoursStart) + ":" + ((minutesStart.length == 1) ? "0" + minutesStart : minutesStart);
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

      tournament.cashPrize?.forEach((element) {
        context.read<ListCashPrizesCubit>().addCashPrize(element);
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

class WidgetChooseImage extends StatelessWidget {
  const WidgetChooseImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocBuilder<TakeImageGalleryCubit, TakeImageGalleryState>(
      builder: (context, state) {
        final imageTaked = state.imageTaked;
        if (imageTaked != null) {
          context.read<SelectedImagePredefCubit>().clearImgSelect();
          context.read<FormTournamentStep4Bloc>().add(FormTournamentImageCupChanged(imageTaked));
        }
        return InkWell(
          onTap: () {
            context.read<TakeImageGalleryCubit>().takePicture();

          },
          child: (imageTaked != null)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colorTheme, width: 3),
                      borderRadius: BorderRadius.circular(9),
                      image: DecorationImage(
                        image: Image.file(
                          imageTaked,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : ShakeAnimatedWidget(
                enabled: (state.runtimeType == TakeImageAnimated) ? true : false,
                duration: const Duration(milliseconds: 300),
                shakeAngle: Rotation.deg(z: 5),
                curve: Curves.linear,
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: (state.runtimeType == TakeImageAnimated) ? const Color(0xffd22f2f) : Colors.white,
                    strokeWidth: 0.6,
                    strokeCap: StrokeCap.round,
                    radius: const Radius.circular(9),
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      height: screenSize.height * 0.08,
                      width: screenSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 23,
                            height: 23,
                            child: Icon(
                              Icons.add,
                              color: colorHintTextTheme,
                            ),
                          ),
                          TextElement(
                            text: "CHOISIR UNE IMAGE",
                            color: Colors.white,
                          ),
                          Text(
                            "max 5 mo",
                            style: TextStyle(
                              color: colorOrange,
                              fontFamily: "o_spawn_cup_font",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ),
        );
      },
    );
  }
}

class RowWidgetNumByPlayer extends StatelessWidget {
  const RowWidgetNumByPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextElement(
            text: "NOMBRE DE JOUEURS PAR EQUIPE",
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listWidgetNumPlayerByTeam,
        ),
      ],
    );
  }
}
