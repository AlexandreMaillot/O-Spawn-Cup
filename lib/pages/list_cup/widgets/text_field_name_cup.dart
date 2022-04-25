import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';

class TextFieldNameCup extends StatelessWidget {
  const TextFieldNameCup({
    Key? key,
    required this.listCupFilterFormBloc,
  }) : super(key: key);

  final ListCupFilterFormBloc listCupFilterFormBloc;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(31)),
      ),
      child: TextFieldBlocBuilder(
        textFieldBloc: listCupFilterFormBloc.name,
        autofillHints: const [AutofillHints.name],
        keyboardType: TextInputType.name,
        suffixButton: SuffixButton.clearText,
        clearTextIcon: Container(
          margin: const EdgeInsets.only(left: 13),
          child: const Icon(
            Icons.clear,
            color: colorHintTextTheme,
          ),
        ),
        decoration: InputDecoration(
          iconColor: Colors.green,
          suffixIconColor: Colors.green,
          fillColor: Colors.green,
          hoverColor: Colors.green,
          focusColor: Colors.green,
          prefixIconColor: Colors.green,
          isCollapsed: true,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: 'NOM DU TOURNOIS',
          hintStyle: TextStyle(
            color: const Color(0xff707070).withOpacity(0.43),
            fontFamily: 'o_spawn_cup_font',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
