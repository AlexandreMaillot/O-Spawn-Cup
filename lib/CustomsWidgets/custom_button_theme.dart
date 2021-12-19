import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButtonTheme extends StatelessWidget {
  Color colorButton;
  String text;
  Function(BuildContext) onPressedMethod;
  final Size screenSize;

  CustomButtonTheme({
    Key? key,
    required this.colorButton,
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
        onPressed: () {
          onPressedMethod(context);
        },
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
            style: const TextStyle(
              color: Color(0xff1B2522),
            )),
      ),
    );
  }
}
