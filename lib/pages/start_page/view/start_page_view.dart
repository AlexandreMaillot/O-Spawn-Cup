import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/login/login.dart';
import 'package:o_spawn_cup/pages/sign_up/sign_up.dart';
import 'package:o_spawn_cup/pages/start_page/start_page.dart';
import 'package:o_spawn_cup/constant.dart';



class StartPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final googleAuthentication = context.read<GoogleAuthenticationCubit>();
    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      body: Column(
        children: [
          Container(
            color: colorTheme,
            // width: screenSize.width,
            height: screenSize.height * 0.61,
            child: Center(
              child: Image.asset('assets/images/logoOSpawnCup.png',
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
                    colorText: colorTextTheme,
                    colorButton: Colors.white,
                    text: 'CONNEXION',
                    onPressedMethod: () => goToLogin(context)),
                CustomButtonTheme(
                    colorText: colorTextTheme,
                    colorButton: colorTheme,
                    text: 'INSCRIPTION',
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
                    imageName: 'assets/images/google.png',
                    text: 'CONNEXION AVEC GOOGLE',
                    onPressedMethod: () => googleAuthentication.logInWithGoogle()),
                CustomButtonConnectWith(
                    screenSize: screenSize,
                    imageName: 'assets/images/facebook.png',
                    text: 'CONNEXION AVEC FACEBOOK',
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
  Navigator.of(context).push<void>(LoginPage.route());
}

void goToRegister(context) {
  Navigator.of(context).push<void>(SignUpPage.route());
}
