import "package:flutter/material.dart";
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/login/bloc/login_form_bloc.dart';

import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_connect_with.dart";
import 'package:o_spawn_cup/start_page/widgets/custom_divider.dart';
import "package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart";
import 'package:o_spawn_cup/service/authentification.dart';

import '../../ui/CustomsWidgets/custom_text_form_field.dart';



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
                            Navigator.pushNamed(context, "/");
                          },
                          icon: const Icon(Icons.arrow_back,color: Color(0xff191919)),
                        ),
                      ),
                      Center(
                            child: Image.asset("assets/images/logoOSpawnCup.png",width: screenSize.width * 0.78, height: screenSize.height * 0.3),
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
                      children: [

                        CustomTextFormField(controller: emailText,screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: false, errorMessage: "Veuillez renseigner votre adresse mail"),
                        _PasswordInput(loginFormBloc: loginFormBloc,),
                        CustomTextFormField(controller: passwordText,screenSize: screenSize,text: "MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: true, errorMessage: "Veuillez renseigner votre mot de passe"),
                      ],
                    ),
                  ),
                ),
                CustomButtonTheme(colorButton: colorTheme,colorText: colorTextTheme,text: "CONNEXION",onPressedMethod: () => loginFormBloc.submit()),
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
                      CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "CONNEXION AVEC GOOGLE", onPressedMethod: () => googleAuthentication.logInWithGoogle()),
                      CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "CONNEXION AVEC FACEBOOK", onPressedMethod: () => print("test")),
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
    required this.loginFormBloc,
  }) : super(key: key);

  final LoginFormBloc loginFormBloc;

  @override
  Widget build(BuildContext context) {
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
        hintText: "MOT DE PASSE",
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
    required this.loginFormBloc,
  }) : super(key: key);

  final LoginFormBloc loginFormBloc;

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textFieldBloc: loginFormBloc.email,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [
        AutofillHints.username,
      ],
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}