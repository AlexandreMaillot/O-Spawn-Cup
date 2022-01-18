import 'dart:math';

import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/model/TournamentType/tounament_type_controller.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/view/list_cup.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController =
      PageController(viewportFraction: 0.3, initialPage: 1);
  var currentPageValue = 1.0;
  int menuActive = 1;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
          drawer: CustomDrawer(screenSize: screenSize),
          appBar: CustomAppBar(title: "JEUX"),
          body: Column(
            children: [
              // Container(
              //   child: simpleTextField(screenSize, "RECHERCHEZ"),
              // ),
              CupList(
                  screenSize: screenSize,
                  pageController: pageController,
                  currentPageValue: currentPageValue)
            ],
          ),
        );
  }
}

class CupList extends StatelessWidget {
  const CupList({
    Key? key,
    required this.screenSize,
    required this.pageController,
    required this.currentPageValue,
  }) : super(key: key);

  final Size screenSize;
  final PageController pageController;
  final double currentPageValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Center(
        child: SizedBox(
          height: screenSize.height,
          child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: pageController,
              itemCount: listCardGame.length,
              itemBuilder: (context, position) {
                if (position == currentPageValue) {
                  return Transform.scale(
                    scale: 1,
                    child: GameCard(position),
                  );
                } else if (position < currentPageValue) {
                  return Transform.scale(
                    scale: max(1 - (currentPageValue - position), 0.75),
                    child: GameCard(position),
                  );
                } else {
                  return Transform.scale(
                    scale: max(1 - (position - currentPageValue), 0.75),
                    child: GameCard(position),
                  );
                }
              }),
        ),
      ),
      color: colorBackgroundTheme,
    ));
  }
}

class GameCard extends StatelessWidget {
  final int index;

  GameCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ListCup(gameName: listCardGame[index].gameName);
            },
          ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Image.asset(
                  listCardGame[index].img,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

SizedBox simpleTextField(Size screenSize, String text) {
  return SizedBox(
    width: screenSize.width,
    height: screenSize.height * 0.06,
    child: TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.bottom,
      showCursor: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          //   // borderRadius: BorderRadius.circular(31),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.circular(31),
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
