import 'package:authentication_repository/authentication_repository.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/sign_up/bloc/sign_up_form_bloc.dart';
import "package:o_spawn_cup/shared/widgets/custom_button_connect_with.dart";
import "package:o_spawn_cup/shared/widgets/custom_button_theme.dart";
import 'package:o_spawn_cup/pages/start_page/widgets/custom_divider.dart';
import "package:o_spawn_cup/shared/widgets/custom_text_field.dart";
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/shared/widgets/custom_text_form_field.dart";



class SignUpForm extends StatelessWidget {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController passwordverifText = TextEditingController();
  TextEditingController pseudoText = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final googleAuthentication = context.read<GoogleAuthenticationCubit>();
    final signUpForm = context.read<SignUpFormBloc>();
    hideKeyBoard() {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackgroundTheme,
        body: GestureDetector(
          onTap: () {
            hideKeyBoard();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: colorTheme,
                  width: screenSize.width,
                  height: screenSize.height * 0.31,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.014),
                        child: IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/");
                          },
                          icon: const Icon(Icons.arrow_back,color: Color(0xff191919)),
                        ),
                      ),
                      Center(
                        child: Image.asset("assets/images/logoOSpawnCup.png",width: screenSize.width * 0.78, height: screenSize.height * 0.3),
                      )
                    ],
                  )
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.022, bottom: screenSize.height * 0.044),
                    child: SizedBox(
                      width: screenSize.width,
                      height: screenSize.height * 0.27,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextFormField(controller: emailText,screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: false, errorMessage: "Veuillez renseigner votre adresse mail"),
                          CustomTextFormField(controller: passwordText,screenSize: screenSize,text: "MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: true, errorMessage: "Veuillez renseigner votre mot de passe"),
                          CustomTextFormField(controller: passwordverifText,screenSize: screenSize,text: "CONFIRMATION MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: true, errorMessage: "Veuillez renseigner votre mot de passe"),
                          CustomTextFormField(controller: pseudoText,screenSize: screenSize,text: "PSEUDO", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: false, errorMessage: "Veuillez renseigner votre pseudo"),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButtonTheme(colorText: colorTextTheme,colorButton: colorTheme,text: "S'INSCRIRE",onPressedMethod: () => signUpForm.submit()),
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
                      CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "S'INSCRIRE AVEC GOOGLE", onPressedMethod: () => googleAuthentication.logInWithGoogle()),
                      CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "S'INSCRIRE AVEC FACEBOOK", onPressedMethod: () => print("test")),
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
