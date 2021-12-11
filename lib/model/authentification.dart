import 'package:firebase_auth/firebase_auth.dart';

class Authentification{


  Authentification();

  void signInWithGoogle(){

  }
  void signInWithFacebook(){

  }
  void signInWithMail(){

  }
  //inscription
  void signUpWithGoogle(){

  }
  void signUpWithFacebook(){

  }
  void signUpWithMail() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "barry.allen@example.com",
          password: "SuperSecretPassword!"
      );
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