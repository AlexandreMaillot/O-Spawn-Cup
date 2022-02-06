import 'package:flutter/material.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_divider.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart';
import 'package:o_spawn_cup/models/authentification.dart';

import '../CustomsWidgets/custom_text_form_field.dart';
import 'login_register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Authentification authentification;
  late TextEditingController emailText;
  late TextEditingController passwordText;

  hideKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void initState() {
    emailText = TextEditingController();
    passwordText = TextEditingController();
    super.initState();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Authentification auth = Authentification();
    return SafeArea(
      child: Scaffold(
          backgroundColor: colorBackgroundTheme,
          body: GestureDetector(
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
                          padding: EdgeInsets.only(top: screenSize.height * 0.014),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/');
                            },
                            icon: Icon(Icons.arrow_back,color: Color(0xff191919)),
                          ),
                        ),
                        Center(
                              child: Image.asset("assets/images/logoOSpawnCup.png",width: screenSize.width * 0.78, height: screenSize.height * 0.3),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.031,bottom: screenSize.height * 0.044),
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.13,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextFormField(controller: emailText,screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: false, errorMessage: "Veuillez renseigner votre adresse mail"),
                            CustomTextFormField(controller: passwordText,screenSize: screenSize,text: "MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: true, errorMessage: "Veuillez renseigner votre mot de passe"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomButtonTheme(screenSize: screenSize,colorButton: colorTheme,colorText: colorTextTheme,text: "CONNEXION",onPressedMethod: () {
                    if(_formKey.currentState!.validate() == true){
                      Future<bool> redirectToHome = auth.signInWithMail(emailText.text, passwordText.text);
                      redirectToHome.then((value) {
                        if(value == true){
                          Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                        }
                      });
                    }
                  }),
                  Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.037, bottom: screenSize.height * 0.024),
                      child: CustomDivider(screenSize: screenSize),
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height*0.125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "CONNEXION AVEC GOOGLE", onPressedMethod: () => print('test')),
                        CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "CONNEXION AVEC FACEBOOK", onPressedMethod: () => print('test')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

