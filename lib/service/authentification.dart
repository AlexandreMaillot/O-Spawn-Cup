import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:o_spawn_cup/models/admin.dart";
import "package:o_spawn_cup/service/firebase_handler.dart";

import "../models/Member/member.dart";

class Authentification {
  Authentification();


  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  void signInWithFacebook() {}

  Future<bool> signInWithMail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email.");
      } else if (e.code == "wrong-password") {
        print("Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  Future<bool> signUpWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential? userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential != null) {
      if(userCredential.additionalUserInfo?.isNewUser == true){
        FirebaseHandler().addMemberFirebase("", userCredential.user!.uid);
      } else {

      }

      return true;
    } else {
      return false;
    }
  }
  Stream<MemberDocumentSnapshot> selectMemberConnected() {
    User? user = FirebaseAuth.instance.currentUser;
    return membersRef.doc(user!.uid).snapshots();
  }

  // Future<bool> memberIsAdmin() async {
  //   return await adminsRef.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) => value).catchError((onError) => false);
  // }
  void signUpWithFacebook() {}

  Future<bool> signUpWithMail(String email, String password,
      String confirmedPassword, String pseudo) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseHandler().addMemberFirebase("", userCredential.user!.uid);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      } else if (e.code == "invalid-email") {
        print("invalid email.");
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }
}
