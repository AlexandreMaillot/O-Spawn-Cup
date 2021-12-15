
import 'package:o_spawn_cup/model/Tournament/tournament.dart';

class RangPointTournament {
  String? uid;
  int rang;
  int point;
  Tournament tournament;

  RangPointTournament({required this.rang,required this.point,required this.tournament});


  RangPointTournament.fromJson(Map<String, Object?> json) : this(
    rang: json["rang"]! as int,
    point: json["point"]! as int,
    tournament: json["tournament"]! as Tournament,
  );


  Map<String, Object?> toJson() {
    return {
      "uid": uid,
      "rang": rang,
      "point": point,
      "tournament": tournament,
    };
  }

}