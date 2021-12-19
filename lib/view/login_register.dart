import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_theme.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_divider.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/view/register.dart';

import 'login.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colorBackgroundTheme,
        body: Column(
          children: [
            Container(
              color: colorTheme,
              width: screenSize.width,
              height: screenSize.height * 0.61,
              child: Center(
                child: Image.asset("assets/images/logoOSpawnCup.png",width: screenSize.width * 0.78, height: screenSize.height * 0.3),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.024),
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.14,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonTheme(screenSize: screenSize,colorButton: Colors.white,text: "CONNEXION",onPressedMethod: goToLogin),
                    CustomButtonTheme(screenSize: screenSize,colorButton: colorTheme,text: "INSCRIPTION",onPressedMethod: goToRegister),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.036, bottom: screenSize.height * 0.014),
              child: CustomDivider(screenSize: screenSize),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height*0.125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "CONNEXION AVEC GOOGLE"),
                  CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "CONNEXION AVEC FACEBOOK"),
                ],
              ),
            ),
          ],
        ),
    );
  }
}


void goToLogin(context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}
void goToRegister(context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Register()),
  );
}
