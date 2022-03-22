import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';

class TeamRepository {
  TeamCollectionReference teamCollectionReference;

  TeamRepository({required this.teamCollectionReference,});
  Future<int> countTeamInTournament(Stream<List<Team>> listTournament) async {
    var teamCollection = await listTournament.length;
    return await listTournament.length;
  }

  addTeamInTournament(Tournament tournament){

  }
  Stream<List<Team>> listTeamsInTournament() {
    return teamCollectionReference.snapshots()
        .map((event) => event.docs
        .map((e) => e.data).toList());
  }

  Future<bool> checkTournamentIsFull(Tournament tournament) async {
    // var numberTeam = await countTeamInTournament(tournament);
    // if(tournament.capacity - numberTeam > 0){
    //   return true;
    // } else {
      return false;
    // }

  }
}