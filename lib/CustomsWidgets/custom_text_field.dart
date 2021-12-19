import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  Size screenSize;
  String text;
  Color buttonColor;
  Color borderColor;
  TextAlign textAlign;

  CustomTextField({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.buttonColor,
    required this.borderColor,
    this.textAlign = TextAlign.center,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.06,
      child: TextField(
        textAlign: textAlign,
        textAlignVertical: TextAlignVertical.bottom,
        showCursor: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(31),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: buttonColor),
            borderRadius: BorderRadius.circular(31),
          ),
          hintText: text,
          hintStyle: TextStyle(
            color: Color(0xff707070).withOpacity(0.43),
            fontFamily: 'o_spawn_cup_font',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}