import 'package:flutter/material.dart';

class CustomButtonConnectWith extends StatelessWidget {
  final Size screenSize;
  final String imageName;
  final String text;
  final VoidCallback onPressedMethod;

  const CustomButtonConnectWith({
    Key? key,
    required this.screenSize,
    required this.imageName,
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
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(31)),
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: screenSize.width * 0.02),
              child: Image.asset(
                imageName,
                width: screenSize.width * 0.05,
                height: screenSize.height * 0.045,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff1B2522),
                fontFamily: 'o_spawn_cup_font',
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
