import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String string;
  NoData({Key? key,required this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
      string,
      style: const TextStyle(
        color: Colors.teal,
        fontSize: 25,
        fontStyle: FontStyle.italic
      ),
    ));
  }
}
