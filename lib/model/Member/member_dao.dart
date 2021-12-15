import 'package:cloud_firestore/cloud_firestore.dart';
import '../../dao.dart';
import 'member.dart';

class MemberDao implements Dao{
  late Member member;
  MemberDao? instance;
  MemberDao(this.member){
    collectionReference = getCollection();
  }

  @override
  late CollectionReference<Object?> collectionReference;

  @override
  create() {
    return collectionReference
        .doc(member.uid)
        .set(member.toJson())
        .then((value) => print("Member Added"))
        .catchError((error) => print("Failed to add Member: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(member.uid)
        .delete()
        .then((value) => print("Member deleted"))
        .catchError((error) => print("Failed to delete Member: $error"));
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('Member').doc(member.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(member.uid)
        .update(member.toJson())
        .then((value) => print("Member updated"))
        .catchError((error) => print("Failed to update Member: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('Member');
  }

}