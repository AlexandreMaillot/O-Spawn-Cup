import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/RoundClassementMember/round_classement_member.dart';

import '../dao.dart';

class RoundClassementMemberDao implements Dao {
  RoundClassementMember roundClassementMember;
  RoundClassementMemberDao(this.roundClassementMember) {
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .add(roundClassementMember.toJson())
        .then((value) => print("RoundClassementMember Added"))
        .catchError((error) => print("Failed to add RoundClassementMember: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(roundClassementMember.uid)
        .delete()
        .then((value) => print("RoundClassementMember deleted"))
        .catchError((error) => print("Failed to delete RoundClassementMember: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('RoundClassementMember');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('RoundClassementMember').doc(roundClassementMember.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(roundClassementMember.uid)
        .update(roundClassementMember.toJson())
        .then((value) => print("RoundClassementMember updated"))
        .catchError((error) => print("Failed to update RoundClassementMember: $error"));
  }
}