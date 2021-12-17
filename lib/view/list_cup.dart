import 'package:flutter/material.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/model/game_name.dart';

class ListCup extends StatefulWidget {
  GameName gameName;

  ListCup({Key? key,required this.gameName}) : super(key: key);

  @override
  _ListCupState createState() => _ListCupState();
}

class _ListCupState extends State<ListCup> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: const CustomAppBar(),
      body: Container(

        child: Text(widget.gameName.toString()),
      ),
    );
  }
}
