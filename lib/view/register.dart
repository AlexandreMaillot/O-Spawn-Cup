import 'package:flutter/material.dart';
import 'package:o_spawn_cup/model/Member/member.dart';
import 'package:o_spawn_cup/model/Member/member_auth_controller.dart';


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
  
  MemberAuthController memberAuthController;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
      child: Text("register with mail"),
        onPressed: (){
          Member member = Member(pseudo: "MonPseudo");
          memberAuthController = MemberAuthController(member);
          memberAuthController.signUpWithMail("barry.allen@example.com","SuperSecretPassword!");
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