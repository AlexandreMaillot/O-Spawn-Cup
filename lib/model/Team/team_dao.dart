import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/dao.dart';
import 'package:o_spawn_cup/model/Team/team.dart';

class TeamDao implements Dao {
  Team team;
  TeamDao(this.team) {
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .add(team.toJson())
        .then((value) => print("Team Added"))
        .catchError((error) => print("Failed to add Team: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(team.uid)
        .delete()
        .then((value) => print("Team deleted"))
        .catchError((error) => print("Failed to delete Team: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('Team');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('Team').doc(team.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(team.uid)
        .update(team.toJson())
        .then((value) => print("Team updated"))
        .catchError((error) => print("Failed to update Team: $error"));
  }

}