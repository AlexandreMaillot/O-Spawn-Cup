import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/Member/member_dao.dart';
import 'package:o_spawn_cup/Tournament/tournament.dart';
import 'package:o_spawn_cup/Tournament/tournament_controller.dart';
import 'package:o_spawn_cup/dao.dart';

class TournamentDao implements Dao {
  late Tournament tournament;
  @override
  late CollectionReference<Object?> collectionReference;

  TournamentDao(this.tournament){
    collectionReference = getCollection();
  }
  @override
  create() {
    return collectionReference
        .add(tournament.toJson())
        .then((value) => print("Tournament Added"))
        .catchError((error) => print("Failed to add Member: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(tournament.uid)
        .delete()
        .then((value) => print("Tournament deleted"))
        .catchError((error) => print("Failed to delete Tournament: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('Tournament');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('Tournament').doc(tournament.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(tournament.uid)
        .update(tournament.toJson())
        .then((value) => print("Tournament updated"))
        .catchError((error) => print("Failed to update Tournament: $error"));
  }

}