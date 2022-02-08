import 'dart:io';

import "package:firebase_storage/firebase_storage.dart" as firebase_storage;
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/server_type.dart';
class FirebaseHandler {
  static final storageRef = firebase_storage.FirebaseStorage.instance.ref();

  Future<String> addImageToStorage(firebase_storage.Reference ref, File file) async {
    firebase_storage.UploadTask task = ref.putFile(file);
    firebase_storage.TaskSnapshot snapshot = await task.whenComplete(() => null);
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }

  addTournamentFirebase(String name, int date, GameName game, ServerType server, TournamentType tournamentType, int capacity, String cashPrize, int roundNumber, int killPointTournament, File file) async {
    final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("tournaments")
        .child(DateTime.now().millisecondsSinceEpoch.toInt().toString());
    final urlString = await addImageToStorage(ref, file);
    Tournament tournament = Tournament(
        name: name,
        date: date,
        game: game,
        server: server,
        tournamentType: tournamentType,
        capacity: capacity,
        cashPrize: cashPrize,
        roundNumber: roundNumber,
        killPointTournament: killPointTournament,
        imageUrl: urlString);
    tournamentsRef.add(tournament);

  }
}