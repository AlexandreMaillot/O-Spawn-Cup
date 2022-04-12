import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';

class TimePick extends StatelessWidget {
  TimePick({
    Key? key,
    required this.inputFieldBloc,
    required this.hintText,
  }) : super(key: key);

  final InputFieldBloc<TimeOfDay?, dynamic> inputFieldBloc;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TimeFieldBlocBuilder(
        timeFieldBloc: inputFieldBloc,
        textAlign: TextAlign.center,
        format: DateFormat('hh:mm'),
        initialTime: const TimeOfDay(hour: 0,minute: 0),
        showClearIcon: true,

        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.access_time_outlined),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
          hintText: hintText,
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
