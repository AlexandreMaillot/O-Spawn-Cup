import "dart:math";

import 'package:dotted_border/dotted_border.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/select_game_bloc/select_game_bloc.dart';
import 'package:o_spawn_cup/bloc/step_by_step_widget_bloc/step_by_step_widget_bloc.dart';
import 'package:o_spawn_cup/bloc/widget_number_by_player_bloc/widget_number_by_player_bloc.dart';
import 'package:o_spawn_cup/models/make_it_responsive.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_app_bar.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_drawer.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_dropdown_tournament_type.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_dropdowwn_game.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_dropdowwn_server.dart";
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_row_textfield_date.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/game_card.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/subtiltle_element.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/text_element.dart";
import "package:o_spawn_cup/constant.dart";

class FormTournament extends StatelessWidget {
  FormTournament({
    Key? key,
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
          create: (_) => StepByStepWidgetBloc(initialIndex: 0),
        ),
        BlocProvider(
          create: (_) => WidgetNumberByPlayerBloc(),
        ),
      ],
      child: FormTournamentView(),
    );
  }
}

class FormTournamentView extends StatelessWidget {
  PageController pageController =
      PageController(viewportFraction: 0.5, initialPage: 1);

  FormTournamentView({Key? key}) : super(key: key);
  late TextEditingController dayController;
  late TextEditingController monthController;
  late TextEditingController yearsController;
  late TextEditingController cupNameController;
  late TextEditingController cashPrizeController;
  late TextEditingController teamNumberController;
  late TextEditingController roundNumberController;
  late TextEditingController pointPerKillController;
  late TextEditingController pointPerRangController;
  late TextEditingController rangStartController;
  late TournamentTypeDropdown tournamentTypeDropdown;
  late ServerDropdown serverDropdown;
  late GameDropdown gameDropdown;
  FocusNode dayFocus = FocusNode();
  FocusNode monthFocus = FocusNode();
  FocusNode yearsFocus = FocusNode();
  FocusNode tournamentFocus = FocusNode();
  @override
  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      context
          .read<SelectGameBloc>()
          .add(SelectGameChange(indexSelect: pageController.page!));
    });

    dayController = TextEditingController();
    monthController = TextEditingController();
    yearsController = TextEditingController();
    cupNameController = TextEditingController();
    cashPrizeController = TextEditingController();
    teamNumberController = TextEditingController();
    roundNumberController = TextEditingController();
    pointPerKillController = TextEditingController();
    pointPerRangController = TextEditingController();
    rangStartController = TextEditingController();
    tournamentTypeDropdown = TournamentTypeDropdown(
      hintText: "TYPE DE TOURNOIS",
      typeFocus: tournamentFocus,
    );
    serverDropdown = ServerDropdown(
      hintText: "SERVEUR",
    );
    gameDropdown = GameDropdown(
      hintText: "JEUX",
    );
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
                                    text: (currentIndex < 4)
                                        ? "VALIDER"
                                        : "TERMINER",
                                    screenSize: screenSize,
                                    colorButton: colorTheme,
                                    colorText: colorBackgroundTheme,
                                    width: screenSize.width / 3,
                                    onPressedMethod: () {
                                      controls.onStepContinue!();
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
                            buildStep4(currentIndex, screenSize),
                            buildStep5(currentIndex, screenSize),
                          ]);
                    },
                  ),
                ),
                // gameDropdown,
                // serverDropdown,
                // tournamentTypeDropdown,
                //

                //
                // CustomTextField(screenSize: screenSize, text: "CASH PRIZE", controller: cashPrizeController),
                //
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: CustomButtonTheme(width: screenSize.width * 0.7,colorButton: colorTheme, colorText: colorBackgroundTheme, screenSize: screenSize, text: "VALIDATION", onPressedMethod: () async {
                //     Stream<TournamentTypeDocumentSnapshot> tournamentTypeSnap = tournamentTypesRef.doc(tournamentTypeDropdown.dropdownValue.toString()).snapshots();
                //     TournamentType? tournamentType;
                //     await tournamentTypeSnap.elementAt(0).then((value) => tournamentType = value.data!);
                //
                //     Tournament tournament = Tournament(
                //         name: cupNameController.text,
                //         date: int.parse(yearsController.text + monthController.text + dayController.text),
                //         game: gameDropdown.dropdownValue!,
                //         server: serverDropdown.dropdownValue!,
                //         tournamentType: tournamentType!,
                //         capacity: int.parse(teamNumberController.text),
                //         cashPrize: cashPrizeController.text,
                //         roundNumber: int.parse(roundNumberController.text),
                //         killPointTournament: int.parse(pointPerKillController.text)
                //     );
                //     tournamentsRef.add(tournament);
                //     Navigator.of(context).pushNamed("/home");
                //     },),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Step buildStep5(int currentIndex,Size screenSize) {
    return Step(
        state: currentIndex > 4 ? StepState.complete : StepState.disabled,
        isActive: currentIndex >= 4,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextElement(
              text: "Gain",
              color: colorTheme,
            )
          ],
        ),
        content: Column(
          children: [Text("5")],
        ));
  }

  Step buildStep4(int currentIndex,Size screenSize) {
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
        content: Container(
          height: screenSize.height * 0.7,
          child: Column(
            children: [
              const WidgetChooseImage(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextElement(text: "ou",color: Colors.white,),
              ),
              TextElement(text: "IMAGES PRE-DEFINIES",color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: listImagePre,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                height: screenSize.height* 0.15,
                child: TextField(
                  style: TextStyle(
                    color: colorBackgroundTheme,
                  ),
                  decoration: InputDecoration(
                      labelText: 'CASH PRIZE',

                      fillColor: Colors.white,
                      filled: true,
                      hoverColor: Colors.white,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  minLines: 5,
                  maxLines: 5,  // allow user to enter 5 line in textfield
                  keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                ),
              ),
            ],
          ),
        ));
  }

  Step buildStep3(int currentIndex,Size screenSize) {
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
          height: screenSize.height * 0.18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(screenSize: screenSize, text: "POINT PAR KILL", controller: pointPerKillController,typeTextField: TextInputType.number,),
              CustomTextField(screenSize: screenSize, text: "POINT PAR RANG", controller: pointPerRangController,typeTextField: TextInputType.number,),
              CustomTextField(screenSize: screenSize, text: "RANG DEBUT DU DECOMPTE", controller: rangStartController,typeTextField: TextInputType.number,),
            ],
          ),
        ));
  }

  Step buildStep2(int currentIndex,Size screenSize) {
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
          height: screenSize.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(screenSize: screenSize, text: "NOM DU TOURNOIS", controller: cupNameController),
              CustomTextField(screenSize: screenSize, text: "NOMBRE DE ROUND(S)", controller: roundNumberController,typeTextField: TextInputType.number,),
              RowTextfieldDate(monthFocus: monthFocus, dayFocus: dayFocus, dayController: dayController, yearsFocus: yearsFocus, monthController: monthController, yearsController: yearsController, screenSize: screenSize,),
              CustomTextField(screenSize: screenSize, text: "NOMBRE D'EQUIPES", controller: teamNumberController,typeTextField: TextInputType.number,),
              const RowWidgetNumByPlayer(),

              serverDropdown,
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
          final indexSelect = context.select((SelectGameBloc bloc) => bloc.state.index);
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
                      child: GameCard(position),
                    );
                  } else if (position < indexSelect) {
                    return Transform.scale(
                      scale: max(1 - (indexSelect - position), 0.75),
                      child: GameCard(position),
                    );
                  } else {
                    return Transform.scale(
                      scale: max(1 - (position - indexSelect), 0.75),
                      child: GameCard(position),
                    );
                  }
                }),
          );
        },
      ),
    );
  }
}



class WidgetChooseImage extends StatelessWidget {

  const WidgetChooseImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {

      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.white,
        strokeWidth: 0.6,
        strokeCap: StrokeCap.round,
        radius: Radius.circular(9),
        padding: EdgeInsets.all(6),
        child: Container(
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
                child: Icon(Icons.add,color: colorHintTextTheme,),
              ),
              TextElement(text: "CHOISIR UNE IMAGE",color: Colors.white,),
              Text("max 5 mo",style: TextStyle(
                color: colorTheme,
                  fontFamily: "o_spawn_cup_font",
              ),)
            ],
          ),
        ),
      ),
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
          child: TextElement(text: "NOMBRE DE JOUEURS PAR EQUIPE",color: Colors.white,),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listWidgetNumPlayerByTeam,
        ),
      ],
    );
  }
}



