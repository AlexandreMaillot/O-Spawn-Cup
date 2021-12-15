import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Dao {
  late final CollectionReference collectionReference;
  create();
  update();
  delete();
  Stream select();
  CollectionReference<Object?> getCollection();
}