import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Round/round.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
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
        .map((tournamentDoc) {
          Tournament tournament = tournamentDoc.data() as Tournament;
          tournament.documentId = tournamentDoc.id;
          return tournament;
        })
        .toList());
  }
  Stream<Tournament?> getTournament(Tournament tournament){
    return tournamentCollectionReference.doc(tournament.documentId).snapshots()
        .map((event) {
          var tournois = event.data;
          tournois?.documentId = tournament.documentId;
          return tournois;
    });
  }
  cupClose(Tournament tournament){
    tournament.state = TournamentState.terminer;
    modifTournamentInFirebase(tournament);
  }
  checkTournamentState(Tournament tournament){
    DateTime dateTimeNow = DateTime.now();
    if(tournament.state == TournamentState.inscriptionFermer) {
      if(tournament.dateDebutInscription!.isBefore(dateTimeNow)){
        changeStateTournament(tournament,TournamentState.inscriptionOuverte);
      }
    }
    if(tournament.state == TournamentState.inscriptionOuverte || tournament.state == TournamentState.inscriptionFermer) {
      if(tournament.dateDebutTournois!.isBefore(dateTimeNow)){
        changeStateTournament(tournament,TournamentState.enCours);
      }
    }
  }
  bool memberIsSign(Member member,List<MemberTournament> allMemberTournament){
    return allMemberTournament.where((element) => element.member == member).isNotEmpty;
  }
  changeStateTournament(Tournament tournament,TournamentState tournamentState){
    tournament.state = tournamentState;
    tournamentCollectionReference.doc(tournament.documentId).set(tournament);
  }
  addTournamentInFirebase(Tournament tournament) async {
    var tournamentAdded = await tournamentCollectionReference.add(tournament);
    for(int i = 1; i <= tournament.roundNumber;i++){
      Round round = Round(roundNumber: i);
      tournamentCollectionReference.doc(tournamentAdded.id).rounds.add(round);
    }
  }
  modifTournamentInFirebase(Tournament tournament){
    tournamentCollectionReference.doc(tournament.documentId).set(tournament);
  }
  deleteTournamentInFirebase(String documentId){
    tournamentCollectionReference.doc(documentId).delete();
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