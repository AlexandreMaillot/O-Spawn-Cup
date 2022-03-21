import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';

class TournamentRepository {

  TournamentCollectionReference tournamentCollectionReference;
  TournamentRepository({required this.tournamentCollectionReference});

  Stream<List<Tournament>> listTournaments({required GameName? gameName,String? name,DateTime? dateStart,TournamentState? tournamentState,TournamentType? tournamentType}) {
    var docRef = tournamentCollectionReference.reference;

    Query<Object?> queryListTournament;
    queryListTournament = addOrderByDateStart(docRef, true);
    queryListTournament = addFilterForGameName(queryListTournament, gameName);
    queryListTournament = addFilterForName(queryListTournament, name);
    queryListTournament = addFilterForDateStart(queryListTournament, dateStart);
    queryListTournament = addFilterForTournamentState(queryListTournament, tournamentState);
    queryListTournament = addFilterForTournamentType(queryListTournament, tournamentType);

    return queryListTournament.snapshots()
        .map((event) => event.docs
        .map((tournamentDoc) => tournamentDoc.data() as Tournament)
        .toList());
  }



  Query<Object?> addOrderByDateStart(Query<Object?> queryListTournament, bool isOrder) {
    return queryListTournament.orderBy("dateDebutTournois", descending: isOrder);
  }
  Query<Object?> addFilterForGameName(Query<Object?> queryListTournament, GameName? gameName) {
    if(gameName == null) {
      return queryListTournament;
    } else {
      return queryListTournament.where("game", isEqualTo: gameName.state);
    }
  }
  Query<Object?> addFilterForName(Query<Object?> queryListTournament, String? name) {
    if(name == null) {
      return queryListTournament;
    } else {
      return queryListTournament.where("name", isEqualTo: name);
    }
  }
  Query<Object?> addFilterForDateStart(Query<Object?> queryListTournament, DateTime? date) {
    if(date == null) {
      return queryListTournament;
    } else {
      return queryListTournament.where("dateDebutTournois", isGreaterThanOrEqualTo: date.toString());
    }
  }
  Query<Object?> addFilterForTournamentState(Query<Object?> queryListTournament, TournamentState? tournamentState) {
    if(tournamentState == null) {
      return queryListTournament;
    } else {
      return queryListTournament.where("state", isEqualTo: tournamentState.name);
    }
  }
  Query<Object?> addFilterForTournamentType(Query<Object?> queryListTournament, TournamentType? tournamentType) {
    if(tournamentType == null) {
      return queryListTournament;
    } else {
      return queryListTournament.where("tournamentType.capacityTeam", isEqualTo: tournamentType.capacityTeam);
    }
  }

}