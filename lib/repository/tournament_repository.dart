import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Round/round.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/filter.dart';

class TournamentRepository {
  final TournamentCollectionReference tournamentCollectionReference;
  TournamentRepository({required this.tournamentCollectionReference});
  Stream<List<Tournament>> listTournaments({
    required GameName? gameName,
    required Filter filter,
  }) {
    final docRef = tournamentCollectionReference.reference;
    Query<Object?> queryListTournament;
    queryListTournament =
        addOrderByDateStart(queryListTournament: docRef, isOrder: true);
    queryListTournament = addFilterForGameName(queryListTournament, gameName);
    queryListTournament = addFilterForName(queryListTournament, filter.name);
    queryListTournament =
        addFilterForDateStart(queryListTournament, filter.dateStart);
    queryListTournament = addFilterForTournamentState(
      queryListTournament,
      filter.tournamentState,
    );
    queryListTournament =
        addFilterForTournamentType(queryListTournament, filter.tournamentType);

    return queryListTournament.snapshots().map(
          (event) => event.docs.map((tournamentDoc) {
            return (tournamentDoc.data()! as Tournament)
              ..documentId = tournamentDoc.id;
          }).toList(),
        );
  }

  Stream<Tournament?> getTournament(Tournament tournament) {
    return tournamentCollectionReference
        .doc(tournament.documentId)
        .snapshots()
        .map((event) {
      final tournois = event.data;
      tournois?.documentId = tournament.documentId;

      return tournois;
    });
  }

  void cupClose(Tournament tournament) {
    tournament.state = TournamentState.terminer;
    modifTournamentInFirebase(tournament);
  }

  void checkTournamentState(Tournament tournament) {
    final dateTimeNow = DateTime.now();
    if (tournament.state == TournamentState.inscriptionFermer) {
      if (tournament.dateDebutInscription!.isBefore(dateTimeNow)) {
        changeStateTournament(tournament, TournamentState.inscriptionOuverte);
      }
    }
    if (tournament.state == TournamentState.inscriptionOuverte ||
        tournament.state == TournamentState.inscriptionFermer) {
      if (tournament.dateDebutTournois!.isBefore(dateTimeNow)) {
        changeStateTournament(tournament, TournamentState.enCours);
      }
    }
  }

  bool memberIsSign(Member member, List<MemberTournament> allMemberTournament) {
    return allMemberTournament
        .where((element) => element.member == member)
        .isNotEmpty;
  }

  void changeStateTournament(
    Tournament tournament,
    TournamentState tournamentState,
  ) {
    tournament.state = tournamentState;
    tournamentCollectionReference.doc(tournament.documentId).set(tournament);
  }

  Future<void> addTournamentInFirebase(Tournament tournament) async {
    final tournamentAdded = await tournamentCollectionReference.add(tournament);
    for (var i = 1; i <= tournament.roundNumber; i++) {
      final round = Round(roundNumber: i);
      await tournamentCollectionReference
          .doc(tournamentAdded.id)
          .rounds
          .add(round);
    }
  }

  void modifTournamentInFirebase(Tournament tournament) {
    tournamentCollectionReference.doc(tournament.documentId).set(tournament);
  }

  void deleteTournamentInFirebase(String documentId) {
    tournamentCollectionReference.doc(documentId).delete();
  }

  Query<Object?> addOrderByDateStart({
    required Query<Object?> queryListTournament,
    required bool isOrder,
  }) {
    return queryListTournament.orderBy(
      'dateDebutTournois',
      descending: isOrder,
    );
  }

  Query<Object?> addFilterForGameName(
    Query<Object?> queryListTournament,
    GameName? gameName,
  ) {
    return gameName == null
        ? queryListTournament
        : queryListTournament.where('game', isEqualTo: gameName.name);
  }

  Query<Object?> addFilterForName(
    Query<Object?> queryListTournament,
    String? name,
  ) {
    return name == null
        ? queryListTournament
        : queryListTournament.where('name', isEqualTo: name);
  }

  Query<Object?> addFilterForDateStart(
    Query<Object?> queryListTournament,
    DateTime? date,
  ) {
    return date == null
        ? queryListTournament
        : queryListTournament.where(
            'dateDebutTournois',
            isGreaterThanOrEqualTo: date.toString(),
          );
  }

  Query<Object?> addFilterForTournamentState(
    Query<Object?> queryListTournament,
    TournamentState? tournamentState,
  ) {
    return tournamentState == null
        ? queryListTournament
        : queryListTournament.where('state', isEqualTo: tournamentState.name);
  }

  Query<Object?> addFilterForTournamentType(
    Query<Object?> queryListTournament,
    TournamentType? tournamentType,
  ) {
    return tournamentType == null
        ? queryListTournament
        : queryListTournament.where(
            'tournamentType.capacityTeam',
            isEqualTo: tournamentType.capacityTeam,
          );
  }
}
