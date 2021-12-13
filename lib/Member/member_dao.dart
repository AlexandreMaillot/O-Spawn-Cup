import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/Member/member_firebase_controller.dart';
import 'package:o_spawn_cup/Member/member_controller.dart';

import '../dao.dart';

class MemberDao implements Dao{
  MemberController memberController;

  MemberDao({required this.memberController}){
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .doc(memberController.member.uid)
        .set(memberController.member.toJson())
        .then((value) => print("Member Added"))
        .catchError((error) => print("Failed to add Member: $error"));
  }

  @override
  delete(String uid) {
    return collectionReference
        .doc(uid)
        .delete()
        .then((value) => print("Member deleted"))
        .catchError((error) => print("Failed to delete Member: $error"));
  }

  @override
  Stream select(String uid) {
    return FirebaseFirestore.instance.collection('Member').doc(uid).snapshots();
  }

  @override
  update(String uid) {
    return collectionReference
        .doc(uid)
        .update(memberController.member.toJson())
        .then((value) => print("Member updated"))
        .catchError((error) => print("Failed to update Member: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('Member');
  }

}