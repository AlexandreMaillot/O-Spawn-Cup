import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/repository/team_repository.dart';

class MockTeamDocumentReference extends Mock implements DocumentReference<Team>{}
class TeamRepositoryOverridden extends TeamRepository {
  @override
  late Stream<List<Team>> listTeamStream = Stream.empty();

  TeamRepositoryOverridden({required TeamCollectionReference teamCollectionReference}) : super(teamCollectionReference: teamCollectionReference);


  @override
  getTeamDocumentReference(Team? team){
    return MockTeamDocumentReference();
  }

  @override
  init(){

  }

  @override
  loadTournament(){
    return Future(() => null,);
  }
}