import 'package:cloud_firestore/cloud_firestore.dart';

import '../dao.dart';
import 'game_map.dart';

class GameMapDao implements Dao {
  GameMap gameMap;
  @override
  late CollectionReference<Object?> collectionReference;

  GameMapDao(this.gameMap){
    collectionReference = getCollection();
  }
  @override
  create() {
    return collectionReference
        .add(gameMap.toJson())
        .then((value) => print("GameMap Added"))
        .catchError((error) => print("Failed to add GameMap: $error"));
  }

  @override
  delete() {
    return collectionReference
        .doc(gameMap.uid)
        .delete()
        .then((value) => print("GameMap deleted"))
        .catchError((error) => print("Failed to delete GameMap: $error"));
  }

  @override
  CollectionReference<Object?> getCollection() {
    return FirebaseFirestore.instance.collection('GameMap');
  }

  @override
  Stream select() {
    return FirebaseFirestore.instance.collection('GameMap').doc(gameMap.uid).snapshots();
  }

  @override
  update() {
    return collectionReference
        .doc(gameMap.uid)
        .update(gameMap.toJson())
        .then((value) => print("GameMap updated"))
        .catchError((error) => print("Failed to update GameMap: $error"));
  }

}