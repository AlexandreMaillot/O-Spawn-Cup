

import 'package:firebase_auth/firebase_auth.dart';

import 'member.dart';
import 'member_dao.dart';

class MemberFirebaseController{
  Member member;
  late MemberDao memberDao;
  MemberFirebaseController({required this.member});



  create(){
    memberDao.create();
  }

  update(){
    memberDao.update();
  }

  deleteAccount() async {
    memberDao.delete();
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