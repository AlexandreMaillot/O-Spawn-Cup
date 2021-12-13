import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHandle {
  CollectionReference getInstanceMap(){
    return FirebaseFirestore.instance.collection('map');
  }
}