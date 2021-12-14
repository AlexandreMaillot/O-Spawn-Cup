import 'package:firebase_auth/firebase_auth.dart';
import 'package:o_spawn_cup/Member/member.dart';
import 'package:o_spawn_cup/Member/member_dao.dart';

import 'member_controller.dart';

class MemberAuthController implements MemberController{
  @override
  Member member;
  late MemberDao memberDao;
  MemberAuthController(this.member){
    memberDao = MemberDao(member);
  }


  signOut(){

  }



  void signWithGoogle(){

  }
  void signInWithMail(){

  }
  void signWithFacebook(){

  }
  void signUpWithMail(String email, String password) async{

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      member.uid = userCredential.user!.uid;
      memberDao.create();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}