import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Dao {
  late final CollectionReference collectionReference;
  create();
  update(String uid);
  delete(String uid);
  Stream select(String uid);
  CollectionReference<Object?> getCollection();
}