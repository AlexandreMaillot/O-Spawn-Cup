import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_theme.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdown_tournament_type.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdowwn_game.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdowwn_server.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_row_textfield_date.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/model/Tournament/tournament.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/model/game_name.dart';
import 'package:o_spawn_cup/model/server_type.dart';

import 'floating_action_bottom_sheet.dart';

class FormTournament extends StatefulWidget {
  const FormTournament({Key? key}) : super(key: key);

  @override
  State<FormTournament> createState() => _FormTournamentState();
}

class _FormTournamentState extends State<FormTournament> {

  late TextEditingController dayController;
  late TextEditingController monthController;
  late TextEditingController yearsController;
  late TextEditingController cupNameController;
  late TextEditingController cashPrizeController;
  late TextEditingController teamNumberController;
  late TextEditingController roundNumberController;
  late TextEditingController pointPerKillController;
  late TournamentTypeDropdown tournamentTypeDropdown;
  late ServerDropdown serverDropdown;
  late GameDropdown gameDropdown;
  FocusNode dayFocus = FocusNode();
  FocusNode monthFocus = FocusNode();
  FocusNode yearsFocus = FocusNode();
  FocusNode fn = FocusNode();
  @override
  void initState() {
    dayController = TextEditingController();
    monthController = TextEditingController();
    yearsController = TextEditingController();
    cupNameController = TextEditingController();
    cashPrizeController = TextEditingController();
    teamNumberController = TextEditingController();
    roundNumberController = TextEditingController();
    pointPerKillController = TextEditingController();
    tournamentTypeDropdown = TournamentTypeDropdown(hintText: "TYPE DE TOURNOIS",typeFocus: fn,);
    serverDropdown = ServerDropdown(hintText: "SERVEUR",);
    gameDropdown = GameDropdown(hintText: "JEUX",);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    FocusNode fn = FocusNode();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      appBar: CustomAppBar(title: "",),
      drawer: CustomDrawer(screenSize: screenSize),
      body: SafeArea(
          child: SizedBox(
            height: screenSize.height * 0.7,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("CREATION DE TOURNOIS",style: TextStyle(color: colorTheme),),
                gameDropdown,
                CustomTextField(screenSize: screenSize, text: "NOM DU TOURNOIS", controller: cupNameController),
                RowTextfieldDate(monthFocus: monthFocus, dayFocus: dayFocus, dayController: dayController, yearsFocus: yearsFocus, monthController: monthController, yearsController: yearsController, screenSize: screenSize,),
                serverDropdown,
                tournamentTypeDropdown,
                CustomTextField(screenSize: screenSize, text: "NOMBRE DE ROUND(S)", controller: roundNumberController,typeTextField: TextInputType.number,),
                CustomTextField(screenSize: screenSize, text: "NOMBRE D'EQUIPES", controller: teamNumberController,typeTextField: TextInputType.number,),

                CustomTextField(screenSize: screenSize, text: "CASH PRIZE", controller: cashPrizeController),
                CustomTextField(screenSize: screenSize, text: "POINT PAR KILL", controller: pointPerKillController,typeTextField: TextInputType.number,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomButtonTheme(width: screenSize.width * 0.7,colorButton: colorTheme, colorText: colorBackgroundTheme, screenSize: screenSize, text: "VALIDATION", onPressedMethod: () async {
                    Stream<TournamentTypeDocumentSnapshot> tournamentTypeSnap = tournamentTypesRef.doc(tournamentTypeDropdown.dropdownValue.toString()).snapshots();
                    TournamentType? tournamentType;
                    await tournamentTypeSnap.elementAt(0).then((value) => tournamentType = value.data!);

                    Tournament tournament = Tournament(
                        name: cupNameController.text,
                        date: int.parse(yearsController.text + monthController.text + dayController.text),
                        game: gameDropdown.dropdownValue!,
                        server: serverDropdown.dropdownValue!,
                        tournamentType: tournamentType!,
                        capacity: int.parse(teamNumberController.text),
                        cashPrize: cashPrizeController.text,
                        roundNumber: int.parse(roundNumberController.text),
                        killPointTournament: int.parse(pointPerKillController.text)
                    );
                    tournamentsRef.add(tournament);
                    Navigator.of(context).pushNamed("/home");
                    },),
                )
              ],
            ),
          ),
      ),
    );
  }
}
