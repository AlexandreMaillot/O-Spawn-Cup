import 'package:cloud_firestore/cloud_firestore.dart';

import '../dao.dart';
import 'game_map_controller.dart';

class GameMapDao implements Dao {
  GameMapController gameMapController;
  @override
  late CollectionReference<Object?> collectionReference;

  GameMapDao({required this.gameMapController}){
    collectionReference = getCollection();
  }
  @override
  create() {
    return collectionReference
        .add(gameMapController.gameMap.toJson())
        .then((value) => print("GameMap Added"))
        .catchError((error) => print("Failed to add GameMap: $error"));
  }

  @override
  delete(String uid) {
    return collectionReference
        .doc(uid)
        .delete()
        .then((value) => print("GameMap deleted"))
        .catchError((error) => print("Failed to delete GameMap: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('GameMap');
  }

  @override
  Stream select(String uid) {
    return FirebaseFirestore.instance.collection('GameMap').doc(uid).snapshots();
  }

  @override
  update(String uid) {
    return collectionReference
        .doc(uid)
        .update(gameMapController.gameMap.toJson())
        .then((value) => print("GameMap updated"))
        .catchError((error) => print("Failed to update GameMap: $error"));
  }

}