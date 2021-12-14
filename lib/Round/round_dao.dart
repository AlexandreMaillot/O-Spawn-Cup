import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/Round/round.dart';

import '../dao.dart';

class RoundDao implements Dao {
  Round round;
  RoundDao({required this.round}) {
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .add(round.toJson())
        .then((value) => print("Round Added"))
        .catchError((error) => print("Failed to add Round: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(round.uid)
        .delete()
        .then((value) => print("Round deleted"))
        .catchError((error) => print("Failed to delete Round: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('Round');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('Round').doc(round.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(round.uid)
        .update(round.toJson())
        .then((value) => print("MemberTournament updated"))
        .catchError((error) => print("Failed to update Round: $error"));
  }

}