import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';

typedef OnChangeCallback = void Function(String data);

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    required this.textFieldBloc,
    required this.hintText,
    this.textInputType,
    this.onChanged,
    this.suffixIcon,
    this.onPressIconSuffix,
    this.textInputAction,
    this.isObscure,
  }) : super(key: key);

  final TextFieldBloc textFieldBloc;
  final String hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final OnChangeCallback? onChanged;
  final Widget? suffixIcon;
  final bool? isObscure;
  final Function()? onPressIconSuffix;
  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      onChanged: onChange,
      textFieldBloc: textFieldBloc,
      autofillHints: const [AutofillHints.name],
      keyboardType: textInputType ?? TextInputType.name,
      textInputAction: textInputAction,
      // suffixButton: SuffixButton.clearText,
      textAlign: TextAlign.center,
      obscureText: isObscure,
      clearTextIcon: Container(
        margin: const EdgeInsets.only(left: 13),
        child: const Icon(
          Icons.clear,
          color: colorHintTextTheme,
        ),
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        isCollapsed: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
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

  void onChange(String value) {
    onChanged?.call(value);
  }
}
