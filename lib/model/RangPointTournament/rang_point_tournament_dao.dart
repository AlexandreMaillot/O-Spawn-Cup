import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/RangPointTournament/rang_point_tournament.dart';

import '../../dao.dart';


class RangPointTournamentDao implements Dao {
  RangPointTournament rangPointTournament;
  RangPointTournamentDao(this.rangPointTournament) {
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .add(rangPointTournament.toJson())
        .then((value) => print("RangPointTournament Added"))
        .catchError((error) => print("Failed to add RangPointTournament: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(rangPointTournament.uid)
        .delete()
        .then((value) => print("RangPointTournament deleted"))
        .catchError((error) => print("Failed to delete RangPointTournament: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('RangPointTournament');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('RangPointTournament').doc(rangPointTournament.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(rangPointTournament.uid)
        .update(rangPointTournament.toJson())
        .then((value) => print("RangPointTournament updated"))
        .catchError((error) => print("Failed to update RangPointTournament: $error"));
  }
}