
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';

import '../../dao.dart';


class TournamentTypeDao implements Dao {
  TournamentType? tournamentType;

  TournamentTypeDao(this.tournamentType){
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {

    // return collectionReference
    //     .add(tournamentType!.toJson())
    //     .then((value) => print("TournamentType Added"))
    //     .catchError((error) => print("Failed to add TournamentType: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(tournamentType!.uid)
        .delete()
        .then((value) => print("TournamentType deleted"))
        .catchError((error) => print("Failed to delete TournamentType: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('TournamentType');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('TournamentType').doc(tournamentType!.uid).snapshots();
  }

  @override
  update() {
    // return collectionReference
    //     .doc(tournamentType!.uid)
    //     .update(tournamentType!.toJson())
    //     .then((value) => print("TournamentType updated"))
    //     .catchError((error) => print("Failed to update TournamentType: $error"));
  }
}