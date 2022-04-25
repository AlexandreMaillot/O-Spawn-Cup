import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width * 0.069,
        right: screenSize.width * 0.069,
      ),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
          Text(
            ' OU ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'o_spawn_cup_font',
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
