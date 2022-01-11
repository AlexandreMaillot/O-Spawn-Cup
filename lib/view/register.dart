import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_theme.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_divider.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';


import '../constant.dart';
import '../constant.dart';
import 'login_register.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController emailText;
  late TextEditingController passwordText;
  late TextEditingController passwordverifText;
  late TextEditingController pseudoText;
  hideKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void initState() {
    emailText = TextEditingController();
    passwordText = TextEditingController();
    passwordverifText = TextEditingController();
    pseudoText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            Navigator.pushNamed(context, '/');
                          },
                          icon: Icon(Icons.arrow_back,color: Color(0xff191919)),
                        ),
                      ),
                      Center(
                        child: Image.asset("assets/images/logoOSpawnCup.png",width: screenSize.width * 0.78, height: screenSize.height * 0.3),
                      )
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.022, bottom: screenSize.height * 0.044),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.27,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(controller: emailText,screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                        CustomTextField(controller: passwordText,screenSize: screenSize,text: "MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white),
                        CustomTextField(controller: passwordverifText,screenSize: screenSize,text: "CONFIRMATION MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white),
                        CustomTextField(controller: pseudoText,screenSize: screenSize,text: "PSEUDO", buttonColor: Colors.white, borderColor: Colors.white),
                      ],
                    ),
                  ),
                ),
                CustomButtonTheme(screenSize: screenSize,colorText: colorTextTheme,colorButton: colorTheme,text: "S'INSCRIRE",onPressedMethod: () => print("okdd")),
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
                      CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "S'INSCRIRE AVEC GOOGLE"),
                      CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "S'INSCRIRE AVEC FACEBOOK"),
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
