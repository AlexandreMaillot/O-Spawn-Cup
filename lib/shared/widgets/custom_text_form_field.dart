import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{

  Size screenSize;
  String text;
  Color buttonColor;
  Color borderColor;
  String errorMessage;
  bool obscuretext;
  TextEditingController? controller;

  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.screenSize,
    required this.text,
    this.buttonColor = Colors.white,
    this.borderColor = Colors.white,
    required this.obscuretext,
    required this.errorMessage,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenSize.width * 0.87,
        height: screenSize.height * 0.05,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.bottom,
          showCursor: false,
          validator: (value) {
            if(value!.isEmpty){
              return errorMessage;
            }
          },
          obscureText: obscuretext,
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
              color: const Color(0xff707070).withOpacity(0.43),
              fontFamily: 'o_spawn_cup_font',
              fontSize: 14,
            ),
          ),
        ),
    );
  }


}