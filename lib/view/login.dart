import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_divider.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_theme.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  hideKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                  height: screenSize.height * 0.48,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.015),
                        child: IconButton(
                          onPressed: (){
                            print('retour');
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
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.062,bottom: screenSize.height * 0.044),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.13,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                        CustomTextField(screenSize: screenSize,text: "MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white),
                      ],
                    ),
                  ),
                ),
                CustomButtonTheme(screenSize: screenSize,colorButton: colorTheme,text: "CONNEXION"),
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
                      CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "CONNEXION AVEC GOOGLE"),
                      CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "CONNEXION AVEC FACEBOOK"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

