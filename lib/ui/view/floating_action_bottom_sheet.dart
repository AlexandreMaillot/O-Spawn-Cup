import "dart:convert";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";
import "package:o_spawn_cup/bloc/list_tournament_bloc/list_tournament_bloc.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_dropdown.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_dropdowwn_tournament_state.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_row_textfield_date.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../models/TournamentType/tournament_type.dart";



class FloatingActionBottomSheet extends StatelessWidget {
  bool bottomSheetIsShow = false;
  late Future<dynamic> bottomSheetController;
  late TextEditingController dayController = TextEditingController();
  late TextEditingController monthController = TextEditingController();
  late TextEditingController yearsController = TextEditingController();
  late TextEditingController tournamentNameController = TextEditingController();
  late CustomDropdown tournamentTypeDropdown = CustomDropdown(hintText: "TYPE DE TOURNOIS",typeFocus: typeFocus,listItem: listTournamentTypeDropdown,onChanged: (context,value)=> print(""),);
  late CustomDropdown tournamentStateDropdown = CustomDropdown(hintText: "ETAT",listItem: listTournamentStateDropdown,onChanged: (context,value)=> print(""));
  late SharedPreferences filters;

  FocusNode dayFocus = FocusNode();
  FocusNode monthFocus = FocusNode();
  FocusNode yearsFocus = FocusNode();
  FocusNode typeFocus = FocusNode();


  // Future<void> initFilter() async {
  //   filters = await SharedPreferences.getInstance();
  //   String day = filters.get("day").toString();
  //   if (day != "null") {
  //     dayController.text = day;
  //   }
  //   String month = filters.get("month").toString();
  //   if (month != "null") {
  //     monthController.text = month;
  //   }
  //   String? years = filters.get("years").toString();
  //   if (years != "null") {
  //     yearsController.text = years;
  //   }
  //   String? tournamentName = filters.get("tournamentName").toString();
  //   if (tournamentName != "null") {
  //     tournamentNameController.text = tournamentName;
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
                  padding: const EdgeInsets.only(top: 25, bottom: 10,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowTextfieldDate(
                          screenSize: screenSize,
                          monthFocus: monthFocus,
                          dayFocus: dayFocus,
                          dayController: dayController,
                          yearsFocus: yearsFocus,
                          monthController: monthController,
                          yearsController: yearsController,
                          onChangedDay: (context,value) => print(""),
                          onChangedMonth: (context,value) => print(""),
                          onChangedYears: (context,value) => print(""),
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
                      CustomButtonTheme(
                        screenSize: screenSize,
                        onPressedMethod: () async {

                          context.read<ListTournamentBloc>().add(TournamentFilter(day: dayController.text, month: monthController.text, year: yearsController.text, tournamentType: tournamentTypeDropdown.dropdownValue as TournamentType?, tournamentState: tournamentStateDropdown.dropdownValue as TournamentState?, name: tournamentNameController.text));
                          Navigator.pop(context);
                        }, text: "RECHERCHER", colorText: colorTheme, colorButton: colorBackgroundTheme,

                      ),
                    ],
                  ),
                  height: screenSize.height * 0.4,
                  // width: screenSize.width,
                ),
              ),
              ArrowButton(screenSize: screenSize),
            ],
          ),
        );
      },
    );
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
