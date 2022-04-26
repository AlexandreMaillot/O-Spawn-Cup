import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/google_authentication/google_authentication_cubit.dart';
import 'package:o_spawn_cup/pages/login/login.dart';
import 'package:o_spawn_cup/pages/sign_up/sign_up.dart';
import 'package:o_spawn_cup/pages/start_page/start_page.dart';

class StartPageView extends StatelessWidget {
  const StartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final googleAuthentication = context.read<GoogleAuthenticationCubit>();

    return Scaffold(
      backgroundColor: colorBackgroundTheme,
      body: Column(
        children: [
          Container(
            color: colorTheme,
            height: screenSize.height * 0.61,
            child: Center(
              child: Image.asset(
                'assets/images/logoOSpawnCup.png',
                width: screenSize.width * 0.78,
                height: screenSize.height * 0.3,
              ),
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
                  onPressedMethod: () => goToLogin(context),
                ),
                CustomButtonTheme(
                  colorText: colorTextTheme,
                  colorButton: colorTheme,
                  text: 'INSCRIPTION',
                  onPressedMethod: () => goToRegister(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.036,
              bottom: screenSize.height * 0.014,
            ),
            child: const CustomDivider(),
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
    );
  }
}

void goToLogin(BuildContext context) {
  Navigator.of(context).push<void>(LoginPage.route());
}

void goToRegister(BuildContext context) {
  Navigator.of(context).push<void>(SignUpPage.route());
}
