import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TimePick extends StatelessWidget {
  const TimePick({
    Key? key,
    required this.inputFieldBloc,
    required this.hintText,
    this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);

  final InputFieldBloc<TimeOfDay?, dynamic> inputFieldBloc;
  final String hintText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TimeFieldBlocBuilder(
        focusNode: focusNode,
        nextFocusNode: nextFocusNode,
        timeFieldBloc: inputFieldBloc,
        textAlign: TextAlign.center,
        format: DateFormat('hh:mm'),
        initialTime: const TimeOfDay(hour: 0, minute: 0),
        showClearIcon: true,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.access_time_outlined),
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          hintText: hintText,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }
}
