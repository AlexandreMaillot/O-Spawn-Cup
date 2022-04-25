import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/pages/sign_up/bloc/sign_up_form_bloc.dart';
import 'package:o_spawn_cup/pages/start_page/widgets/custom_divider.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final googleAuthentication = context.read<GoogleAuthenticationCubit>();
    final signUpForm = context.read<SignUpFormBloc>();
    void hideKeyBoard() {
      FocusScope.of(context).requestFocus(FocusNode());
    }

    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackgroundTheme,
        body: GestureDetector(
          onTap: hideKeyBoard,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: colorTheme,
                  width: screenSize.width,
                  height: screenSize.height * 0.31,
                  child: Stack(
                    children: [
                      IconButton(
                        padding:
                            EdgeInsets.only(top: screenSize.height * 0.014),
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff191919),
                        ),
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
                    top: screenSize.height * 0.022,
                    bottom: screenSize.height * 0.044,
                  ),
                  child: SizedBox(
                    width: screenSize.width,
                    height: screenSize.height * 0.27,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldForm(
                          textFieldBloc: signUpForm.email,
                          hintText: 'E-MAIL',
                          textInputAction: TextInputAction.next,
                        ),
                        TextFieldForm(
                          textFieldBloc: signUpForm.password,
                          hintText: 'MOT DE PASSE',
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.visiblePassword,
                          isObscure: true,
                        ),
                        TextFieldForm(
                          textFieldBloc: signUpForm.confirmPassword,
                          hintText: 'CONFIRMATION MOT DE PASSE',
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.visiblePassword,
                          isObscure: true,
                        ),
                        TextFieldForm(
                          textFieldBloc: signUpForm.pseudo,
                          hintText: 'PSEUDO',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButtonTheme(
                  colorText: colorTextTheme,
                  colorButton: colorTheme,
                  text: "S'INSCRIRE",
                  onPressedMethod: signUpForm.submit,
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
                        text: "S'INSCRIRE AVEC GOOGLE",
                        onPressedMethod: googleAuthentication.logInWithGoogle,
                      ),
                      CustomButtonConnectWith(
                        screenSize: screenSize,
                        imageName: 'assets/images/facebook.png',
                        text: "S'INSCRIRE AVEC FACEBOOK",
                        onPressedMethod: () => log('test'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
