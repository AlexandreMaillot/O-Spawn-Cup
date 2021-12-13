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
      child: showButtons(),
    );
  }
}

Column showButtons(){
  Authentification auth = Authentification();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
      child: Text("register with mail"),
        onPressed: (){
          auth.signUpWithMail("barry.allen@example.com","SuperSecretPassword!");
        },
      ),
      ElevatedButton(
        child: Text("register with google"),
        onPressed: (){

        },
      ),

    ],
  );
}