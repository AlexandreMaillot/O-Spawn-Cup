import 'package:flutter/material.dart';

import '../constant.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff191919),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
                child: Stack(
                  children: [
                    Container(
                      color: const Color(0xffA9E5C7),
                      width: screenSize.width,
                      height: screenSize.height / 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.height * 0.16,
                          left: screenSize.width * 0.1),
                      child: imageFromAsset(
                          screenSize.width * 0.78,
                          screenSize.height * 0.3,
                          "assets/images/logoOSpawnCup.png"),
                    ),
                  ],
                ),
              ),
              simpleTextField(screenSize, "E-MAIL"),
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.012,
                    bottom: screenSize.height * 0.044),
                child: simpleTextField(screenSize, "MOT DE PASSE"),
              ),
              ConnectionButton(screenSize: screenSize),
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.037,
                    left: screenSize.width * 0.069,
                    right: screenSize.width * 0.069,
                    bottom: screenSize.height*0.024),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      " OU ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'o_spawn_cup_font',
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: screenSize.height * 0.0064),
                  child: buttonOtherConnexion(screenSize,"assets/images/google.png","CONNEXION AVEC GOOGLE"),
              ),
              buttonOtherConnexion(screenSize,"assets/images/facebook.png","CONNEXION AVEC FACEBOOK"),
            ],
          ),
        ));
  }
}

class ConnectionButton extends StatelessWidget {
  const ConnectionButton({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.06,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(colorButton),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          )),
        ),
        child: const Text("CONNEXION",
            style: TextStyle(
              color: Color(0xff1B2522),
            )),
      ),
    );
  }
}

Image imageFromAsset(double width, double height, String imageName) {
  return Image.asset(
    imageName,
    height: height,
    width: width,
  );
}

SizedBox simpleTextField(Size screenSize, String text) {
  return SizedBox(
    width: screenSize.width * 0.87,
    height: screenSize.height * 0.06,
    child: TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.bottom,
      showCursor: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(31),
        ),
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff707070).withOpacity(0.43),
          fontFamily: 'o_spawn_cup_font',
          fontSize: 14,
        ),
      ),
    ),
  );
}

SizedBox buttonOtherConnexion(Size screenSize,String imageName,String text){
  return SizedBox(
    width: screenSize.width * 0.87,
    height: screenSize.height * 0.06,
    child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              )),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: screenSize.width*0.02),
              child: imageFromAsset(screenSize.width*0.05, screenSize.height*0.045, imageName),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff1B2522),
                fontFamily: 'o_spawn_cup_font',
                fontSize: 13,
              ),
            ),
          ],
        )
    ),
  );
}
