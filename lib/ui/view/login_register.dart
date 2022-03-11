import 'package:flutter/material.dart';
import 'package:o_spawn_cup/service/authentification.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_divider.dart';
import 'package:o_spawn_cup/constant.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Authentification auth = Authentification();
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      body: Column(
        children: [
          Container(
            color: colorTheme,
            // width: screenSize.width,
            height: screenSize.height * 0.61,
            child: Center(
              child: Image.asset("assets/images/logoOSpawnCup.png",
                  width: screenSize.width * 0.78,
                  height: screenSize.height * 0.3),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: screenSize.height * 0.024),
            height: screenSize.height * 0.14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonTheme(
                    screenSize: screenSize,
                    colorText: colorTextTheme,
                    colorButton: Colors.white,
                    text: "CONNEXION",
                    onPressedMethod: () => goToLogin(context)),
                CustomButtonTheme(
                    screenSize: screenSize,
                    colorText: colorTextTheme,
                    colorButton: colorTheme,
                    text: "INSCRIPTION",
                    onPressedMethod: () => goToRegister(context)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.036,
                bottom: screenSize.height * 0.014),
            child: CustomDivider(screenSize: screenSize),
          ),
          SizedBox(
            height: screenSize.height * 0.125,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonConnectWith(
                    screenSize: screenSize,
                    imageName: "assets/images/google.png",
                    text: "CONNEXION AVEC GOOGLE",
                    onPressedMethod: () {
                      Future<bool> redirectToHome = auth.signUpWithGoogle();
                      redirectToHome.then((value) {
                        if (value == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home', (Route<dynamic> route) => false);
                        }
                      });
                    }),
                CustomButtonConnectWith(
                    screenSize: screenSize,
                    imageName: "assets/images/facebook.png",
                    text: "CONNEXION AVEC FACEBOOK",
                    onPressedMethod: () => print('test')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void goToLogin(context) {
  Navigator.pushNamed(context, '/login');
}

void goToRegister(context) {
  Navigator.pushNamed(context, '/register');
}
