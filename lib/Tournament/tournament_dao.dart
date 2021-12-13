import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/Tournament/tournament_controller.dart';
import 'package:o_spawn_cup/dao.dart';

class TournamentDao implements Dao {
  TournamentController tournamentController;
  @override
  late CollectionReference<Object?> collectionReference;

  TournamentDao({required this.tournamentController}){
    collectionReference = getCollection();
  }
  @override
  create() {
    return collectionReference
        .add(tournamentController.tournament.toJson())
        .then((value) => print("Tournament Added"))
        .catchError((error) => print("Failed to add Member: $error"));
  }

  @override
  delete(String uid) {
    return collectionReference
        .doc(uid)
        .delete()
        .then((value) => print("Tournament deleted"))
        .catchError((error) => print("Failed to delete Tournament: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('Tournament');
  }

  @override
  Stream select(String uid) {
    return FirebaseFirestore.instance.collection('Tournament').doc(uid).snapshots();
  }

  @override
  update(String uid) {
    return collectionReference
        .doc(uid)
        .update(tournamentController.tournament.toJson())
        .then((value) => print("Tournament updated"))
        .catchError((error) => print("Failed to update Tournament: $error"));
  }

}