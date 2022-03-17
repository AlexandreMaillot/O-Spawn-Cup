import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/bloc/bloc_router.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/home/view/home.dart';
import 'package:o_spawn_cup/services/authentification.dart';
import 'package:o_spawn_cup/shared/widgets/custom_button_theme.dart';
import 'package:o_spawn_cup/pages/form_tournament/view/form_tournament.dart';

import '../../models/Member/member.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {

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
                            "Mon Pseudo",
                          style: TextStyle(color: Colors.white,),
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
                        children: const [
                          HomeButton(),
                          ProfilButton(),
                          CreateCupButton(),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                    const LogoutButton()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateCupButton extends StatelessWidget {
  const CreateCupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MemberDocumentSnapshot>(
      stream: Authentification().selectMemberConnected(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          if(snapshot.data?.data?.isAdmin == true) {
            return CustomButtonTheme(
            colorText: colorTextTheme,
            colorButton: Colors.white,
            text: "CREER UN TOURNOIS",
            onPressedMethod: () => Navigator.of(context).push<void>(FormTournament(tournament: null).route()),
          );
          }
        }
        return Container();
      }
    );
  }
}

class ProfilButton extends StatelessWidget {
  const ProfilButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonTheme(
      colorText: colorTextTheme,
      colorButton: Colors.white,
      text: "PROFIL",
      onPressedMethod: () => print("profil"),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return CustomButtonTheme(
      colorText: colorTextTheme,
      colorButton: Colors.white,
      text: "ACCUEIL",
      onPressedMethod: () => Navigator.of(context).pushAndRemoveUntil(Home.route(), (Route<dynamic> route) => false),
    );
  }
}

class LogoutButton extends StatelessWidget {

  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationRepository = context.read<AuthenticationRepository>();
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
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
        onPressed: () => authenticationRepository.logOut(),
      ),
    );
  }
}
