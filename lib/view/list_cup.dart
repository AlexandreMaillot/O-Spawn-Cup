import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/card_cup.dart';
import 'package:o_spawn_cup/model/game_name.dart';
import 'package:o_spawn_cup/view/test.dart';

import 'floating_action_bottom_sheet.dart';

class ListCup extends StatefulWidget {
  GameName gameName;

  ListCup({Key? key, required this.gameName}) : super(key: key);

  @override
  _ListCupState createState() => _ListCupState();
}

class _ListCupState extends State<ListCup> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<State<FloatingActionBottomSheet>> keyFloating = GlobalKey<State<FloatingActionBottomSheet>>();
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(
        title: "TOURNOIS",
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: GestureDetector(
        onTap: () {
          print(keyFloating.currentState!.widget.bottomSheetIsShow);
          if(keyFloating.currentState!.widget.bottomSheetIsShow){

            Navigator.of(context).pop();
          }

        },
        child: Container(
          color: colorBackgroundTheme,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index) {
              return CardCup(index: index);
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionBottomSheet(
        key: keyFloating,
        screenSize: screenSize,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      // shape: const CircularNotchedRectangle(),
      color: colorTheme,
      child: Row(
        children: <Widget>[
          Container(
            height: 25,
          )
        ],
      ),
    );
  }
}



