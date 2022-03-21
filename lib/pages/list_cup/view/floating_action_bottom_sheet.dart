
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import "package:flutter_svg/svg.dart";
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';
import 'package:o_spawn_cup/pages/list_cup/cubit/list_cup_cubit.dart';
import 'package:o_spawn_cup/pages/list_cup/list_cup.dart';
import "package:o_spawn_cup/shared/widgets/custom_button_theme.dart";
import "package:o_spawn_cup/shared/widgets/custom_dropdown.dart";
import "package:o_spawn_cup/shared/widgets/custom_text_field.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:shared_preferences/shared_preferences.dart";




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

  @override
  Widget build(BuildContext context) {
    final listCupFilterFormBloc = context.read<ListCupFilterFormBloc>();
    Size screenSize = MediaQuery.of(context).size;
    final blocListCubit = context.read<ListCupCubit>();
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
                  width: MediaQuery.of(context).size.width,

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

                      RowDatePick(listCupFilterFormBloc: listCupFilterFormBloc),
                      DropdownTournamentState(listCupFilterFormBloc: listCupFilterFormBloc),
                      // tournamentTypeDropdown,
                      CustomTextField(
                          controller: tournamentNameController,
                          textAlign: TextAlign.left,
                          screenSize: screenSize,
                          text: "NOM DU TOURNOIS",
                          buttonColor: Colors.white,
                          borderColor: Colors.white),
                      DropdownTournamentType(listCupFilterFormBloc: listCupFilterFormBloc),
                      CustomButtonTheme(
                        onPressedMethod: () async {
                          int? years = int.tryParse(yearsController.text);
                          int? month = int.tryParse(monthController.text);
                          int? day = int.tryParse(dayController.text);
                          String? name = tournamentNameController.text;
                          blocListCubit.loadListCupWithFilter(
                              name: (name != "") ? name : null,
                              tournamentType: tournamentTypeDropdown.dropdownValue as TournamentType?,
                              tournamentState: tournamentStateDropdown.dropdownValue as TournamentState?,
                              dateStart: (years != null && month != null && day != null) ? DateTime(years,month,day) : null);
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
