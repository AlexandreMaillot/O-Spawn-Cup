import 'package:flutter/material.dart';


class CustomButtonTheme extends StatelessWidget {
  Color colorButton;
  Color colorText;
  String text;
  VoidCallback onPressedMethod;
  final Size screenSize;
  double width;
  double height;
  CustomButtonTheme({
    Key? key,
    this.width = 0,
    this.height = 0,
    required this.colorButton,
    required this.colorText,
    required this.screenSize,
    required this.text,
    required this.onPressedMethod,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (width == 0.0 ) ? screenSize.width * 0.87 : width,
      height: (height == 0.0) ? screenSize.height * 0.06 : height,
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
