

import 'package:firebase_auth/firebase_auth.dart';

import 'member.dart';


class MemberFirebaseController{
  Member member;

  MemberFirebaseController({required this.member});



  create(){

  }

  update(){

  }

  deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  initPassword(){

  }

}