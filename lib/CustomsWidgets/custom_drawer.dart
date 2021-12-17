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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(),
                  Text("Mon Pseudo"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 11, right: 11, top: 14),
              color: colorTheme,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenSize.height * 0.23,
                    child: Column(
                      children: [
                        CustomButtonTheme(
                          screenSize: screenSize,
                          colorButton: Colors.white,
                          text: "ACCUEIL",
                        ),
                        CustomButtonTheme(
                          screenSize: screenSize,
                          colorButton: Colors.white,
                          text: "PROFIL",
                        ),
                        CustomButtonTheme(
                          screenSize: screenSize,
                          colorButton: Colors.white,
                          text: "RESULTATS DES TOURNOIS",
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    child: TextButton(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Déconnexion",
                            style: TextStyle(
                              color: colorBackgroundTheme,
                            ),
                          ),
                          Icon(Icons.power_settings_new,color: colorBackgroundTheme,),
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
