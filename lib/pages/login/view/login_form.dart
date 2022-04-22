import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/login/bloc/login_form_bloc.dart';
import 'package:o_spawn_cup/pages/login/login.dart';

import 'package:o_spawn_cup/shared/widgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/pages/start_page/widgets/custom_divider.dart';
import 'package:o_spawn_cup/shared/widgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/services/authentification.dart';




class LoginForm extends StatelessWidget {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginFormBloc = context.read<LoginFormBloc>();
    final googleAuthentication = context.read<GoogleAuthenticationCubit>();
    hideKeyBoard() {
      FocusScope.of(context).requestFocus(FocusNode());
    }

    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
          onTap: () {
            hideKeyBoard();
          },
          child: SingleChildScrollView(
          child:  Column(
              children: [
                Container(
                  color: colorTheme,
                  width: screenSize.width,
                  height: screenSize.height * 0.46,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.05),
                        child: IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/');
                          },
                          icon: const Icon(Icons.arrow_back,color: Color(0xff191919)),
                        ),
                      ),
                      Center(
                            child: Image.asset('assets/images/logoOSpawnCup.png',width: screenSize.width * 0.78, height: screenSize.height * 0.3),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.031,bottom: screenSize.height * 0.044),
                  child: SizedBox(
                    width: screenSize.width,
                    height: screenSize.height * 0.13,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _EmailInput(),
                        _PasswordInput(),
                      ],
                    ),
                  ),
                ),
                CustomButtonTheme(colorButton: colorTheme,colorText: colorTextTheme,text: 'CONNEXION',onPressedMethod: () => loginFormBloc.submit()),
                Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.037, bottom: screenSize.height * 0.024),
                    child: CustomDivider(screenSize: screenSize),
                ),
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height*0.125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonConnectWith(screenSize: screenSize,imageName: 'assets/images/google.png',text: 'CONNEXION AVEC GOOGLE', onPressedMethod: () => googleAuthentication.logInWithGoogle()),
                      CustomButtonConnectWith(screenSize : screenSize, imageName: 'assets/images/facebook.png', text: 'CONNEXION AVEC FACEBOOK', onPressedMethod: () => print('test')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginFormBloc = context.read<LoginFormBloc>();
    return TextFieldBlocBuilder(
      textFieldBloc: loginFormBloc.password,
      suffixButton: SuffixButton.obscureText,
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(31),
        ),
        hintText: 'MOT DE PASSE',
        hintStyle: TextStyle(
          color: const Color(0xff707070).withOpacity(0.43),
          fontFamily: 'o_spawn_cup_font',
          fontSize: 14,
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(31),
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