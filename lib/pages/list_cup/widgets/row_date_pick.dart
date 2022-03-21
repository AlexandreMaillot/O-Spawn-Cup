import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';

class RowDatePick extends StatelessWidget {
  const RowDatePick({
    Key? key,
    required this.listCupFilterFormBloc,
  }) : super(key: key);


  final ListCupFilterFormBloc listCupFilterFormBloc;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(31),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container(),),
              DottedLine(
                direction: Axis.vertical,
                lineThickness: 0.5,
                dashColor: colorHintTextTheme.withOpacity(0.43),
              ),
              Expanded(child: Container()),
              DottedLine(
                direction: Axis.vertical,
                lineThickness: 0.5,
                dashColor: colorHintTextTheme.withOpacity(0.43),
              ),
              Expanded(child: Container()),
            ],
          ),
          DateTimeFieldBlocBuilder(
            showClearIcon: false,
            dateTimeFieldBloc: listCupFilterFormBloc.startCupDate,
            format: DateFormat('          dd                      MM                   yyyy'),
            initialDate: DateTime(2020,01,01),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            decoration: const InputDecoration(
              isCollapsed: true,
              hintText: "Début tournois",

              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),],
      ),
    );
  }
}