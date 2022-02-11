import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';

import '../../bloc/form_tournament_step_2_bloc/form_tournament_step_2_bloc.dart';



typedef onChangeCallback = void Function(BuildContext context, String data);

class RowTextfieldDate extends StatelessWidget {
  RowTextfieldDate({
    Key? key,
    required this.screenSize,
    required this.monthFocus,
    required this.dayFocus,
    required this.dayController,
    required this.yearsFocus,
    required this.monthController,
    required this.yearsController,
    this.onChangedDay,
    this.onChangedMonth,
    this.onChangedYears,
    this.paddingBottom = 0,
  }) : super(key: key);

  final Size screenSize;
  final FocusNode monthFocus;
  final FocusNode dayFocus;
  final TextEditingController dayController;
  onChangeCallback? onChangedDay;
  onChangeCallback? onChangedMonth;
  onChangeCallback? onChangedYears;
  final FocusNode yearsFocus;
  final TextEditingController monthController;
  final TextEditingController yearsController;
  double paddingBottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Column(
        children: [
          Container(
            width: screenSize.width * 0.87,
            height: screenSize.height * 0.05,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(31),
              border: context.read<FormTournamentStep2Bloc>().state.day.invalid ? Border.all(color: const Color(0xffd22f2f)) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 2) {
                        FocusScope.of(context).requestFocus(monthFocus);
                      }
                      onChangedDay!(context, value);
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
                      if (value.length == 2) {
                        FocusScope.of(context).requestFocus(yearsFocus);
                      }
                      onChangedMonth!(context, value);
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
                      onChangedYears!(context, value);
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
          context.read<FormTournamentStep2Bloc>().state.day.invalid
              ? Padding(
                  padding: const EdgeInsets.only(top: 6.0, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "La date est erroné !",
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
  }
}
