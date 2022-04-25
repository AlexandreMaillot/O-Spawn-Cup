import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/services/firebase_handler.dart';

class Authentification {
  Authentification();

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> signInWithMail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user != null || false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      log(e.toString());

      return false;
    }

    return false;
  }

  Future<bool> signUpWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.user != null) {
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        FirebaseHandler().addMemberFirebase('', userCredential.user!.uid);
      }

      return true;
    } else {
      return false;
    }
  }

  Stream<MemberDocumentSnapshot> selectMemberConnected() {
    final user = FirebaseAuth.instance.currentUser;

    return membersRef.doc(user!.uid).snapshots();
  }

  void signUpWithFacebook() {
    // TODO(Tamarok): facebook login
  }

  Future<bool> signUpWithMail(
    String email,
    String password,
    String confirmedPassword,
    String pseudo,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseHandler().addMemberFirebase('', userCredential.user!.uid);
      final user = FirebaseAuth.instance.currentUser;

      return user != null || false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        log('invalid email.');
      }
    } catch (e) {
      log(e.toString());

      return false;
    }

    return false;
  }
}
