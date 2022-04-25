import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/widgets/create_cup_button.dart';
import 'package:o_spawn_cup/shared/widgets/home_button.dart';
import 'package:o_spawn_cup/shared/widgets/logout_button.dart';
import 'package:o_spawn_cup/shared/widgets/profil_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: colorBackgroundTheme,
                width: screenSize.width,
                padding: const EdgeInsets.only(bottom: 26),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: CircleAvatar(
                          radius: 56,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          'Mon Pseudo',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          HomeButton(),
                          ProfilButton(),
                          CreateCupButton(),
                        ],
                      ),
                    ),
                    const LogoutButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
