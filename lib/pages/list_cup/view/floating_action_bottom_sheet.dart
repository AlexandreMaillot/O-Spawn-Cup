
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
  @override
  Widget build(BuildContext context) {
    final listCupFilterFormBloc = context.read<ListCupFilterFormBloc>();
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
      onPressed: () => showModalBottomSheet(
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
                      TextFieldNameCup(listCupFilterFormBloc: listCupFilterFormBloc),
                      DropdownTournamentType(listCupFilterFormBloc: listCupFilterFormBloc),
                      CustomButtonTheme(
                        onPressedMethod: () {
                          listCupFilterFormBloc.submit();
                          Navigator.pop(context);
                        }, text: "RECHERCHER", colorText: colorTheme, colorButton: colorBackgroundTheme,

                      ),
                    ],
                  ),
                  height: screenSize.height * 0.4,
                  // width: screenSize.width,
                ),
              ),
              const ArrowButton(),
            ],
          ),
        ),
    );
  }
}












