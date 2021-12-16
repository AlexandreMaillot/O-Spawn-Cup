import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.create)),
        ],
        title: const Text(
          "JEUX",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'o_spawn_cup_font',
            fontSize: 29,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: simpleTextField(screenSize, "RECHERCHEZ"),
          ),
          Expanded(
              child: Container(
            color: colorBackgroundTheme,
          ))
        ],
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
