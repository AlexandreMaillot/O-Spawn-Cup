import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';

class RowDatePick extends StatelessWidget {
  RowDatePick({
    Key? key,
    required this.inputFieldBloc,
    required this.hintText,
    this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);


  final InputFieldBloc<DateTime?, dynamic> inputFieldBloc;
  final String hintText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: DateTimeFieldBlocBuilder(
              focusNode: focusNode,
              nextFocusNode: nextFocusNode,
              showClearIcon: true,
              textAlign: TextAlign.center,
              dateTimeFieldBloc: inputFieldBloc,
              format: DateFormat('dd/MM/yyyy'),
              initialDate: DateTime(2020,01,01),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.date_range),
                hintText: hintText,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                filled: true,

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
        ),
    );
  }
}