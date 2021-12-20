import 'package:flutter/material.dart';


class CustomButtonTheme extends StatelessWidget {
  Color colorButton;
  Color colorText;
  String text;
  VoidCallback onPressedMethod;
  final Size screenSize;

  CustomButtonTheme({
    Key? key,
    required this.colorButton,
    required this.colorText,
    required this.screenSize,
    required this.text,
    required this.onPressedMethod,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.06,
      child: ElevatedButton(
        onPressed: onPressedMethod,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorButton),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          )),
          // elevation: MaterialStateProperty.all<double>(
          // ),
        ),
        child: Text(text,
            style: TextStyle(
              color: colorText,
            )),
      ),
    );
  }
}
