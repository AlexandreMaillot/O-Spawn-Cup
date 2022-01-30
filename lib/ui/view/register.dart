import 'package:flutter/material.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/authentification.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_button_connect_with.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_button_theme.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_divider.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/ui/CustomsWidgets/custom_text_form_field.dart';


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
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.022, bottom: screenSize.height * 0.044),
                    child: Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.27,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextFormField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: false, errorMessage: "Veuillez renseigner votre adresse mail"),
                          CustomTextFormField(screenSize: screenSize,text: "MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: true, errorMessage: "Veuillez renseigner votre mot de passe"),
                          CustomTextFormField(screenSize: screenSize,text: "CONFIRMATION MOT DE PASSE", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: true, errorMessage: "Veuillez renseigner votre mot de passe"),
                          CustomTextFormField(screenSize: screenSize,text: "PSEUDO", buttonColor: Colors.white, borderColor: Colors.white,obscuretext: false, errorMessage: "Veuillez renseigner votre pseudo"),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButtonTheme(screenSize: screenSize,colorText: colorTextTheme,colorButton: colorTheme,text: "S'INSCRIRE",onPressedMethod: () {
                  if(!_formKey.currentState!.validate()){
                    auth.signUpWithMail(emailText.text, passwordText.text, passwordverifText.text, pseudoText.text);
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
                      CustomButtonConnectWith(screenSize: screenSize,imageName: "assets/images/google.png",text: "S'INSCRIRE AVEC GOOGLE", onPressedMethod: () => auth.signUpWithGoogle()),
                      CustomButtonConnectWith(screenSize : screenSize, imageName: "assets/images/facebook.png", text: "S'INSCRIRE AVEC FACEBOOK", onPressedMethod: () => print('test')),
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
