import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdowwn_tournament_state.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/CustomsWidgets/search_button.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdown_tournament_type.dart';
import 'package:o_spawn_cup/model/TournamentType/tounament_type_controller.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class FloatingActionBottomSheet extends StatefulWidget {
  bool bottomSheetIsShow = false;
  final Function functionFilter;
  FloatingActionBottomSheet({
    Key? key,
    required this.functionFilter,
  }) : super(key: key);

  @override
  State<FloatingActionBottomSheet> createState() =>
      _FloatingActionBottomSheetState();
}

class _FloatingActionBottomSheetState extends State<FloatingActionBottomSheet> {
  late Future<dynamic> bottomSheetController;
  late TextEditingController dayController;
  late TextEditingController monthController;
  late TextEditingController yearsController;
  late TextEditingController tournamentNameController;
  late TournamentTypeDropdown tournamentTypeDropdown;
  late TournamentStateDropdown tournamentStateDropdown;
  late SharedPreferences filters;

  FocusNode dayFocus = FocusNode();
  FocusNode monthFocus = FocusNode();
  FocusNode yearsFocus = FocusNode();
  FocusNode typeFocus = FocusNode();
  @override
  initState() {
    dayController = TextEditingController();
    monthController = TextEditingController();
    yearsController = TextEditingController();
    tournamentNameController = TextEditingController();
    tournamentTypeDropdown = TournamentTypeDropdown(hintText: "TYPE DE TOURNOIS",typeFocus: typeFocus);
    tournamentStateDropdown = TournamentStateDropdown(hintText: "ETAT");
    super.initState();
  }

  Future<void> initFilter() async {
    filters = await SharedPreferences.getInstance();
    String day = filters.get("day").toString();
    if (day != "null") {
      dayController.text = day;
    }
    String month = filters.get("month").toString();
    if (month != "null") {
      monthController.text = month;
    }
    String? years = filters.get("years").toString();
    if (years != "null") {
      yearsController.text = years;
    }
    String? tournamentName = filters.get("tournamentName").toString();
    if (tournamentName != "null") {
      tournamentNameController.text = tournamentName;
    }
    String? tournamentType = filters.getString("tournamentType");
    if (tournamentType != "null") {
      tournamentTypeDropdown.dropdownValue = tournamentType;
    }
    String? tournamentState = filters.getString("tournamentState");
    if (tournamentState != "null") {
      tournamentStateDropdown.dropdownValue = tournamentState;
    }
  }
  // @override
  // void dispose() {
  //   dayController.dispose();
  //   monthController.dispose();
  //   yearsController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    DateTime selectedDate = DateTime.now();

    return FloatingActionButton(
      heroTag: "filterMenu",
      elevation: 0,
      backgroundColor: colorTheme,
      child: SvgPicture.asset(
        "assets/images/parameterIcon.svg",
        height: 30,
        width: 30,
      ),
      onPressed: () {
        setState(() {
          widget.bottomSheetIsShow = true;
        });

        bottomSheetController = showModalBottomSheet(

          isScrollControlled: true,
          context: context,
          builder: (context) => Stack(
            children: [
              Container(
                padding: MediaQuery.of(context).viewInsets,
                color: colorBackgroundTheme,
                child: Container(
                  decoration: BoxDecoration(
                      color: colorTheme,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  padding: const EdgeInsets.only(top: 25, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenSize.width * 0.87,
                        height: screenSize.height * 0.06,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(31),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  if(value.length == 2){
                                    FocusScope.of(context).requestFocus(monthFocus);
                                  }

                                },
                                focusNode: dayFocus,
                                controller: dayController,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  hintText: "JOUR",
                                  counterText: "",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            DottedLine(
                              direction: Axis.vertical,
                              lineThickness: 0.5,
                              dashColor: colorHintTextTheme.withOpacity(0.43),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  if(value.length == 2){
                                    FocusScope.of(context).requestFocus(yearsFocus);
                                  }
                                },
                                focusNode: monthFocus,
                                controller: monthController,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(),
                                decoration: const InputDecoration(
                                  hintText: "MOIS",
                                  counterText: "",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            DottedLine(
                              direction: Axis.vertical,
                              lineThickness: 0.5,
                              dashColor: colorHintTextTheme.withOpacity(0.43),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  // if(value.length == 4) {
                                  //   FocusScope.of(context).requestFocus(typeFocus);
                                  // }
                                },
                                focusNode: yearsFocus,
                                controller: yearsController,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  hintText: "ANNEE",
                                  counterText: "",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      tournamentTypeDropdown,
                      CustomTextField(
                          controller: tournamentNameController,
                          textAlign: TextAlign.left,
                          screenSize: screenSize,
                          text: "NOM DU TOURNOIS",
                          buttonColor: Colors.white,
                          borderColor: Colors.white),
                      tournamentStateDropdown,
                      SearchButton(
                        screenSize: screenSize,
                        onPressedMethod: () async {

                          await saveFilter();
                          widget.functionFilter();
                          Navigator.pop(context,tournamentNameController.text);
                        },
                      ),
                    ],
                  ),
                  height: screenSize.height * 0.4,
                  width: screenSize.width,
                ),
              ),
              ArrowButton(screenSize: screenSize),
            ],
          ),
        );

        initFilter();
      },
    );
  }

  saveFilter() async {
    filters = await SharedPreferences.getInstance();
    filters.setString("day", dayController.text);
    filters.setString("month", monthController.text);
    filters.setString("years", yearsController.text);
    filters.setString("tournamentName", tournamentNameController.text);

    if (tournamentTypeDropdown.dropdownValue != "null") {
      filters.setString(
          "tournamentType", tournamentTypeDropdown.dropdownValue.toString());
    }

    if (tournamentStateDropdown.dropdownValue != "null") {
      filters.setString(
          "tournamentState", tournamentStateDropdown.dropdownValue.toString());
    }
    // print(tournamentTypeDropdown.dropdownValue.toString());
    // print(tournamentStateDropdown.dropdownValue.toString());
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          transform: Matrix4.translationValues(
              0.0, screenSize.height * 0.96 - screenSize.height, 0.0),
          child: FloatingActionButton(
            heroTag: "validFilter",
            elevation: 0,
            backgroundColor: colorTheme,
            child: SvgPicture.asset(
              "assets/images/arrowFilter.svg",
              height: 25,
              width: 24,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
