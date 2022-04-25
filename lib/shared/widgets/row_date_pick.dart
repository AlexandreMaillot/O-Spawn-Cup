import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RowDatePick extends StatelessWidget {
  const RowDatePick({
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
        initialDate: DateTime(2020, 01, 01),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.date_range),
          hintText: hintText,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
