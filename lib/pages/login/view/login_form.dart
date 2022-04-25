import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/login/bloc/login_form_bloc.dart';
import 'package:o_spawn_cup/pages/start_page/widgets/custom_divider.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginFormBloc = context.read<LoginFormBloc>();
    final googleAuthentication = context.read<GoogleAuthenticationCubit>();
    void hideKeyBoard() {
      FocusScope.of(context).requestFocus(FocusNode());
    }

    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: hideKeyBoard,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: colorTheme,
              width: screenSize.width,
              height: screenSize.height * 0.46,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(top: screenSize.height * 0.05),

                    // TODO(Tamarok): check push
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xff191919)),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/logoOSpawnCup.png',
                      width: screenSize.width * 0.78,
                      height: screenSize.height * 0.3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.031,
                bottom: screenSize.height * 0.044,
              ),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.13,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldForm(
                      textFieldBloc: loginFormBloc.email,
                      hintText: 'E-MAIL',
                    ),
                    TextFieldForm(
                      textFieldBloc: loginFormBloc.email,
                      hintText: 'MOT DE PASSE',
                    ),
                  ],
                ),
              ),
            ),
            CustomButtonTheme(
              colorButton: colorTheme,
              colorText: colorTextTheme,
              text: 'CONNEXION',
              onPressedMethod: loginFormBloc.submit,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.037,
                bottom: screenSize.height * 0.024,
              ),
              child: const CustomDivider(),
            ),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonConnectWith(
                    screenSize: screenSize,
                    imageName: 'assets/images/google.png',
                    text: 'CONNEXION AVEC GOOGLE',
                    onPressedMethod: googleAuthentication.logInWithGoogle,
                  ),
                  CustomButtonConnectWith(
                    screenSize: screenSize,
                    imageName: 'assets/images/facebook.png',
                    text: 'CONNEXION AVEC FACEBOOK',
                    onPressedMethod: () => log('test'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
