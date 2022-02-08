import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef MyDialogueCallback = void Function(BuildContext context, String data);

class CustomTextField extends StatelessWidget {
  Size screenSize;
  String text;
  Color buttonColor;
  Color borderColor;
  TextAlign textAlign;
  TextEditingController? controller;
  TextInputType? typeTextField;
  MyDialogueCallback? onChanged;
  Function()? onPressIconSuffix;
  Widget? suffixIcon;
  CustomTextField({
    Key? key,
    required this.screenSize,
    required this.text,
    this.buttonColor = Colors.white,
    this.borderColor = Colors.white,
    required this.controller,
    this.textAlign = TextAlign.center,
    this.typeTextField = TextInputType.text,
    this.onChanged,
    this.onPressIconSuffix,
    this.suffixIcon,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.05,
      child: TextField(
        inputFormatters: (typeTextField != TextInputType.text)
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
              ]
            : [],
        onChanged: (value) {
          if(onChanged != null){
            onChanged!(context, value);
          }

        },
        keyboardType: typeTextField ?? TextInputType.text,
        controller: controller,
        textAlign: textAlign,
        textAlignVertical: TextAlignVertical.bottom,
        showCursor: false,
        decoration: InputDecoration(
          suffixIcon: (suffixIcon != null)
              ? IconButton(
                  onPressed: onPressIconSuffix,
                  icon: suffixIcon!,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                )
              : null,
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
