import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_button_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // padding: EdgeInsets.only(top: 70),
              color: colorBackgroundTheme,
              width: screenSize.width,
              padding: const EdgeInsets.only(left: 22,bottom: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 56,
                    ),
                  ),
                  SizedBox(
                    // width: 56,
                    child: Text(
                        "Mon Pseudo",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 11, right: 11, top: 14),
              color: colorTheme,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.23,
                    child: Column(
                      children: [
                        CustomButtonTheme(
                          colorText: colorTextTheme,
                          screenSize: screenSize,
                          colorButton: Colors.white,
                          text: "ACCUEIL",
                          onPressedMethod: () => print("home"),
                        ),
                        CustomButtonTheme(
                          colorText: colorTextTheme,
                          screenSize: screenSize,
                          colorButton: Colors.white,
                          text: "PROFIL",
                          onPressedMethod: () => print("profil"),
                        ),
                        CustomButtonTheme(
                          colorText: colorTextTheme,
                          screenSize: screenSize,
                          colorButton: Colors.white,
                          text: "RESULTATS DES TOURNOIS",
                          onPressedMethod: () => print("result"),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width,
                    child: TextButton(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.power_settings_new,color: colorBackgroundTheme,),
                          ),
                          Text(
                            "Déconnexion",
                            style: TextStyle(
                              color: colorBackgroundTheme,
                            ),
                          ),

                        ],
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
