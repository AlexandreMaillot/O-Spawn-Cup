import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/pages/login/bloc/login_form_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginFormBloc = context.read<LoginFormBloc>();

    return TextFieldBlocBuilder(
      textFieldBloc: loginFormBloc.email,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [
        AutofillHints.username,
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(31)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(31)),
        ),
        hintText: 'E-MAIL',
        hintStyle: TextStyle(
          color: const Color(0xff707070).withOpacity(0.43),
          fontFamily: 'o_spawn_cup_font',
          fontSize: 14,
        ),
      ),
    );
  }
}
