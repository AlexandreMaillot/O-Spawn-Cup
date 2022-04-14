import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/cup_details/bloc/sign_tournament_form_bloc.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
typedef onChangeCallback = void Function(String data);
class TextFieldForm extends StatelessWidget {
  TextFieldForm({
    Key? key,
    required this.textFieldBloc,
    required this.hintText,
    this.textInputType,
    this.onChanged,
    this.suffixIcon,
    this.onPressIconSuffix,
    this.textInputAction,
  }) : super(key: key);

  final TextFieldBloc textFieldBloc;
  final String hintText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  onChangeCallback? onChanged;
  Widget? suffixIcon;
  Function()? onPressIconSuffix;
  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      onChanged: (value) {
        if(onChanged != null){
          onChanged!(value);
        }
      },

      textFieldBloc: textFieldBloc,
      autofillHints: const [AutofillHints.name],
      keyboardType: textInputType ?? TextInputType.name,
      textInputAction: textInputAction,
      // suffixButton: SuffixButton.clearText,
      textAlign: TextAlign.center,
      clearTextIcon: Container(margin: const EdgeInsets.only(left: 13),child: Icon(Icons.clear,color: colorHintTextTheme,)),
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        isCollapsed: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: (suffixIcon != null)
            ? IconButton(
          onPressed: onPressIconSuffix,
          icon: suffixIcon!,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff707070).withOpacity(0.43),
          fontFamily: 'o_spawn_cup_font',
          fontSize: 14,
        ),
      ),
    );
  }
}