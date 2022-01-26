import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';


class RowTextfieldDate extends StatelessWidget {
  const RowTextfieldDate({
    Key? key,
    required this.screenSize,
    required this.monthFocus,
    required this.dayFocus,
    required this.dayController,
    required this.yearsFocus,
    required this.monthController,
    required this.yearsController,
  }) : super(key: key);

  final Size screenSize;
  final FocusNode monthFocus;
  final FocusNode dayFocus;
  final TextEditingController dayController;
  final FocusNode yearsFocus;
  final TextEditingController monthController;
  final TextEditingController yearsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.05,
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 1),
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
    );
  }
}