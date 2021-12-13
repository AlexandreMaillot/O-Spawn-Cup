import 'package:cloud_firestore/cloud_firestore.dart';

class KillPointTournament {
  int pointPerKill;


  KillPointTournament({required this.pointPerKill});

  CollectionReference getInstanceKillPointTournament(){
    return FirebaseFirestore.instance.collection('killPointTournament');
  }

  KillPointTournament.fromJson(Map<String, Object?> json) : this(
    pointPerKill: json["gameName"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "pointPerKill": pointPerKill,
    };
  }

  calculKillPoint(int kill) {

  }
  updateKillPointTournament() {

  }
}