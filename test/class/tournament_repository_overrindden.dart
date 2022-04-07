import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

class MockTournamentDocumentReference extends Mock implements DocumentReference<Tournament>{}
class TournamentRepositoryOverridden extends TournamentRepository {
  TournamentRepositoryOverridden({required TournamentCollectionReference tournamentCollectionReference}) : super(tournamentCollectionReference: tournamentCollectionReference);

  @override
  getTournament(Tournament tournament){
    return Stream.empty();
  }
}