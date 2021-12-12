import 'package:flutter/material.dart';

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
        backgroundColor: Color(0xff191919),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenSize.height*0.02),
                child:  Stack(
                  children: [
                    Container(
                      color: Color(0xffF2E96B),
                      width: screenSize.width,
                      height: screenSize.height/2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height*0.1,left: screenSize.width * 0.06),
                      child:
                      imageFromAsset(250,210,"assets/images/logoOSpawnCup.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width*0.87,
                height: screenSize.height*0.06,
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
                    hintText: 'E-MAIL',
                    hintStyle: TextStyle(
                      color: Color(0xff707070),
                      fontFamily: 'o_spawn_cup_font',
                      fontSize: 14,
                    ),
                  ),
                ),
              )

            ],
          ),
        )
    );
  }
}

Image imageFromAsset(double width, double height, String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.cover,
    height: height,
    width: width,
  );
}