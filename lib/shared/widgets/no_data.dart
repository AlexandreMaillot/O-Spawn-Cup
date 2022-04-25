import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String string;
  const NoData({Key? key, required this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        string,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontFamily: 'o_spawn_cup_font',
        ),
      ),
    );
  }
}
