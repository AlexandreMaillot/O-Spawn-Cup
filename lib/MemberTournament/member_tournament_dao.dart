import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/dao.dart';
import 'package:o_spawn_cup/MemberTournament/member_tournament.dart';

class MemberTournamentDao implements Dao {
  MemberTournament memberTournament;

  MemberTournamentDao(this.memberTournament){
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .add(memberTournament.toJson())
        .then((value) => print("MemberTournament Added"))
        .catchError((error) => print("Failed to add MemberTournament: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(memberTournament.uid)
        .delete()
        .then((value) => print("MemberTournament deleted"))
        .catchError((error) => print("Failed to delete MemberTournament: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('MemberTournament');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('MemberTournament').doc(memberTournament.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(memberTournament.uid)
        .update(memberTournament.toJson())
        .then((value) => print("MemberTournament updated"))
        .catchError((error) => print("Failed to update MemberTournament: $error"));
  }

}