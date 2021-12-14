import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/TeamClassementTournament/team_classement_tournament.dart';
import 'package:o_spawn_cup/dao.dart';

class TeamClassementTournamentDao implements Dao {
  TeamClassementTournament teamClassementTournament;


  TeamClassementTournamentDao(this.teamClassementTournament){
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .add(teamClassementTournament.toJson())
        .then((value) => print("TeamClassementTournament Added"))
        .catchError((error) => print("Failed to add TeamClassementTournament: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(teamClassementTournament.uid)
        .delete()
        .then((value) => print("TeamClassementTournament deleted"))
        .catchError((error) => print("Failed to delete TeamClassementTournament: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('TeamClassementTournament');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('TeamClassementTournament').doc(teamClassementTournament.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(teamClassementTournament.uid)
        .update(teamClassementTournament.toJson())
        .then((value) => print("TeamClassementTournament updated"))
        .catchError((error) => print("Failed to update TeamClassementTournament: $error"));
  }



}