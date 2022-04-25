import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';

class TeamRepository {
  TeamCollectionReference teamCollectionReference;
  late Tournament tournament;
  List<Team> listTeam = [];
  late Stream<List<Team>> listTeamStream;
  TeamRepository({
    required this.teamCollectionReference,
  }) {
    init();
  }

  void init() {
    loadTournament();
    listTeamStream = teamCollectionReference.snapshots().map(
          (event) => event.docs
              .where((element) => !element.data.isDisqualified)
              .map((teamDoc) {
            return teamDoc.data.copyWith(documentId: teamDoc.id);
          }).toList(),
        );

    listTeamStream.listen((event) async {
      for (final team in event) {
        await addListMemberTournamentInTeam(team);
      }

      listTeam = event;
    });
  }

  Stream<List<MemberTournament>> listAllMemberTournamentInTeamCollection() {
    return teamCollectionReference.reference.firestore
        .collectionGroup('membersTournament')
        .snapshots()
        .map(
          (event) => event.docs.map((e) {
            return MemberTournament.fromJson(e.data()).copyWith(
              documentId: e.id,
            );
          }).toList(),
        );
  }

  Future<Team> addListMemberTournamentInTeam(Team team) async {
    final memberTournament = await teamCollectionReference
        .doc(team.documentId)
        .membersTournament
        .get();

    return team.copyWith(
      listMemberTournament: memberTournament.docs.map((e) => e.data).toList(),
    );
  }

  Future<void> loadTournament() async {
    final tournamentDocument = await teamCollectionReference.parent.get();
    tournament = tournamentDocument.data!;
  }

  Team disqualifiedTeamWithNoMember(Team team) {
    var teamModified = team;
    if (team.listMemberTournament.isEmpty) {
      teamModified = team.copyWith(isDisqualified: true);
    }
    teamCollectionReference.doc(teamModified.documentId).set(teamModified);

    return teamModified;
  }

  int numberTeamInTournament() {
    return listTeam.length;
  }

  Future<bool> checkNameTeam(String name) async {
    final teamExistWithName = listTeam.where((element) => element.name == name);

    return teamExistWithName.isEmpty;
  }

  DocumentReference<Team> getTeamDocumentReference(Team team) {
    return teamCollectionReference.doc(team.documentId).reference;
  }

  Future<TeamDocumentSnapshot?> findTeamWithCode(String teamCode) async {
    final teamExistWithCode =
        listTeam.where((element) => element.teamCode == teamCode);

    return teamExistWithCode.isNotEmpty
        ? await teamCollectionReference
            .doc(teamExistWithCode.first.documentId)
            .get()
        : null;
  }

  String generateCodeTeam(String beforeCode, int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final _rnd = Random();

    return beforeCode +
        String.fromCharCodes(
          Iterable.generate(
            length,
            (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
          ),
        );
  }

  Future<TeamDocumentReference> addTeamInTournament(
    Team team,
  ) async {
    final f = DateFormat('mmMMssddhh');
    team.copyWith(teamCode: generateCodeTeam(f.format(DateTime.now()), 6));

    return teamCollectionReference.add(team);
  }

  Stream<List<Team>> listTeamsInTournament() {
    return listTeamStream;
  }

  Future<bool> checkTeamCapacity(Team team) async {
    return team.listMemberTournament.length + 1 <=
            tournament.tournamentType.capacityTeam ||
        false;
  }

  Future<bool> checkTournamentCapacity() async {
    final numberTeam = numberTeamInTournament();

    return tournament.capacity - numberTeam + 1 > 0 || false;
  }
}
