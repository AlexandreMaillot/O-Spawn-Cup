import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';

class TextFieldTeamName extends StatelessWidget {
  String text;
  TextFieldTeamName({
    Key? key,
    required this.signTournamentFormBloc,
    required this.text,
  }) : super(key: key);

  final SignTournamentFormBloc signTournamentFormBloc;

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
      child: TextFieldBlocBuilder(
        textFieldBloc: signTournamentFormBloc.teamName,
        autofillHints: [AutofillHints.name],
        keyboardType: TextInputType.name,
        // suffixButton: SuffixButton.clearText,
        textAlign: TextAlign.center,
        clearTextIcon: Container(margin: EdgeInsets.only(left: 13),child: Icon(Icons.clear,color: colorHintTextTheme,)),

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
          hintText: text,
          hintStyle: TextStyle(
            color: const Color(0xff707070).withOpacity(0.43),
            fontFamily: "o_spawn_cup_font",
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}