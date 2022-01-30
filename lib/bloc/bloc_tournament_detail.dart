import "dart:async";
import "dart:math";

import "package:o_spawn_cup/bloc/bloc.dart";
import "package:o_spawn_cup/models/Team/team.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";

class BlocTournamentDetail extends Bloc {
  final String _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
  final Random _rnd = Random();
  String msgSnack = "";
  Tournament tournament;



  String getRandomString(int length) {
    return tournament.documentId!.substring(0, 5) +
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<Team?> verifCodeTeam(Team? team,String teamName) async {
    TournamentDocumentSnapshot teamQuery =
    await tournamentsRef.doc(tournament.documentId).get();
    Iterable<Team>? teamList = teamQuery.data?.listTeam
        .where((element) => element.teamCode == teamName);
    if (teamList!.isNotEmpty) {
      team = teamList.first;
    } else {
      msgSnack = "Le code équipe n'existe pas !";
      // errorSign = true;
    }
    return team;
  }

  Future<Team?> verifTeamName(Team? team,String teamName) async {
    team = await (Team? team) async {
      TournamentDocumentSnapshot teamQuery =
      await tournamentsRef.doc(tournament.documentId).get();
      Iterable<Team>? teamList = teamQuery.data?.listTeam
          .where((element) => element.name == teamName);
      if (teamList!.isEmpty) {
        team = Team(name: teamName);
        teamsRef.add(team);
      } else {
        msgSnack = "Le nom de cette team existe déjà !";
        // errorSign = true;
      }
      return team;
    }(team);
    return team;
  }


  addTeamInTournament(Team team) async {
    tournament.listTeam.add(team);
    await tournamentsRef
        .doc(tournament.documentId)
        .set(tournament);
  }

  final _streamControllerValue = StreamController<double>();


  Stream<double> get streamValue => _streamControllerValue.stream;
  Sink<double> get sinkValue => _streamControllerValue.sink;



  BlocTournamentDetail({required this.tournament}){




    // sinkValue.add(currentValue);
  }

  @override
  dispose() {
    _streamControllerValue.close();
  }

}