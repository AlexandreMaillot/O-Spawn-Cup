import 'package:flutter/material.dart';
import 'package:o_spawn_cup/model/authentification.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: ElevatedButton(
        child: Text("test"),
        onPressed: (){
          Authentification auth = Authentification();
          auth.signUpWithMail();
        },
      ),
    );
  }
}