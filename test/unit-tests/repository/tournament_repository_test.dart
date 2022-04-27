import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/server_type.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/filter.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

void main() {
  late TournamentRepository tournamentRepository;
  final now = DateTime.now();
  late TournamentCollectionReference tournamentsRef;
  late FakeFirebaseFirestore instance;
  late QuerySnapshot<Map<String, dynamic>> snapshot;
  final tournament4 = Tournament(
    name: 'Tournois 4',
    dateDebutTournois: DateTime(now.year, now.month, now.day + 7),
    game: GameName.leagueOfLegend,
    server: ServerType.eu,
    tournamentType: TournamentType.quintet,
    capacity: 33,
    roundNumber: 3,
    dateDebutInscription: DateTime(now.year, now.month + 1, now.day + 7),
    killPointTournament: 1,
    pointPerRangTournament: 1,
    rangStartTournament: 15,
    cashPrize: const ['Mon lot 1', 'Mon lot 2', 'Mon lot 3'],
    listCodesGames: const [
      'MonCode1',
      'MonCode2',
      'MonCode3',
    ],
  );
  final listTournaments = <Tournament>[
    Tournament(
      name: 'Tournois 1',
      dateDebutTournois: DateTime(now.year, now.month, now.day + 7),
      game: GameName.leagueOfLegend,
      server: ServerType.eu,
      tournamentType: TournamentType.quintet,
      capacity: 33,
      roundNumber: 3,
      dateDebutInscription: DateTime(now.year, now.month + 1, now.day + 7),
      killPointTournament: 1,
      pointPerRangTournament: 1,
      rangStartTournament: 15,
      cashPrize: const ['Mon lot 1', 'Mon lot 2', 'Mon lot 3'],
      listCodesGames: const [
        'MonCode1',
        'MonCode2',
        'MonCode3',
      ],
    ),
    Tournament(
      name: 'Tournois 2',
      dateDebutTournois: DateTime(now.year, now.month, now.day + 3),
      game: GameName.leagueOfLegend,
      server: ServerType.eu,
      tournamentType: TournamentType.quintet,
      capacity: 33,
      roundNumber: 3,
      dateDebutInscription: DateTime(now.year, now.month + 1, now.day + 3),
      killPointTournament: 1,
      pointPerRangTournament: 1,
      rangStartTournament: 15,
      cashPrize: const ['Mon lot 1', 'Mon lot 2', 'Mon lot 3'],
      listCodesGames: const [
        'MonCode1',
        'MonCode2',
        'MonCode3',
      ],
    ),
    Tournament(
      name: 'Tournois 3',
      dateDebutTournois: DateTime(now.year, now.month, now.day + 5),
      game: GameName.fornite,
      server: ServerType.eu,
      tournamentType: TournamentType.trio,
      capacity: 33,
      roundNumber: 3,
      dateDebutInscription: DateTime(now.year, now.month + 1, now.day + 5),
      killPointTournament: 1,
      pointPerRangTournament: 1,
      rangStartTournament: 15,
      cashPrize: const ['Mon lot 1', 'Mon lot 2', 'Mon lot 3'],
      listCodesGames: const [
        'MonCode1',
        'MonCode2',
        'MonCode3',
      ],
    ),
  ];
  setUp(() async {
    instance = FakeFirebaseFirestore();
    listTournaments.first.state = TournamentState.enCours;
    listTournaments.first.documentId = 'id1';
    listTournaments[1].documentId = 'id2';
    listTournaments[2].documentId = 'id3';
    var index = 0;
    for (final element in listTournaments) {
      index++;
      await instance
          .collection('Tournament')
          .doc('id$index')
          .set(element.toJson());
    }
    tournamentsRef = TournamentCollectionReference(instance);
    tournamentRepository =
        TournamentRepository(tournamentCollectionReference: tournamentsRef);
  });
  group('Liste les tournois avec filtre', () {
    test('list tournaments no tournaments', () async {
      final baseDelete = TournamentCollectionReference(FakeFirebaseFirestore());
      final tournamentRepositoryClear =
          TournamentRepository(tournamentCollectionReference: baseDelete);
      expect(
        tournamentRepositoryClear.listTournaments(
          gameName: null,
          filter: const Filter(),
        ),
        emits([]),
      );
    });
    test('list tournaments no filter expect order', () async {
      listTournaments.sort(
        (a, b) => b.dateDebutTournois!
            .compareTo(a.dateDebutTournois ?? DateTime.now()),
      );
      expect(
        tournamentRepository.listTournaments(
          gameName: null,
          filter: const Filter(),
        ),
        emits(listTournaments),
      );
    });
    test('list tournaments order by date', () {
      listTournaments.sort(
        (a, b) => b.dateDebutTournois!
            .compareTo(a.dateDebutTournois ?? DateTime.now()),
      );

      expect(
        tournamentRepository.listTournaments(
          gameName: null,
          filter: const Filter(),
        ),
        emits(listTournaments),
      );
    });
    test('list tournaments filter by game', () {
      expect(
        tournamentRepository.listTournaments(
          gameName: GameName.fornite,
          filter: const Filter(),
        ),
        emits(
          listTournaments.where((element) => element.game == GameName.fornite),
        ),
      );
    });

    test('list tournaments filter by name', () {
      expect(
        tournamentRepository.listTournaments(
          gameName: null,
          filter: const Filter(name: 'Tournois 2'),
        ),
        emits(listTournaments.where((element) => element.name == 'Tournois 2')),
      );
    });
    test('list tournaments filter by date start cup', () {
      final date = DateTime(now.year, now.month, now.day + 4);
      expect(
        tournamentRepository.listTournaments(
          gameName: null,
          filter: Filter(dateStart: date),
        ),
        emits(
          listTournaments
              .where((element) => element.dateDebutTournois!.isAfter(date)),
        ),
      );
    });
    test('list tournaments filter by state', () {
      expect(
        tournamentRepository.listTournaments(
          gameName: null,
          filter: const Filter(tournamentState: TournamentState.enCours),
        ),
        emits(
          listTournaments
              .where((element) => element.state == TournamentState.enCours),
        ),
      );
    });
    test('list tournaments filter by type', () {
      expect(
        tournamentRepository.listTournaments(
          gameName: null,
          filter: const Filter(tournamentType: TournamentType.trio),
        ),
        emits(
          listTournaments.where(
            (element) => element.tournamentType == TournamentType.trio,
          ),
        ),
      );
    });
  });

  test('change state tournament', () async {
    tournamentRepository.changeStateTournament(
      listTournaments.first,
      TournamentState.annuler,
    );

    snapshot = await instance.collection('Tournament').get();
    final snapTournament = await snapshot.docs.first.reference.get();
    final tournament = snapTournament.data();
    expect(tournament!['state'], TournamentState.annuler.name);
  });
  test('close cup', () async {
    tournamentRepository.cupClose(
      listTournaments.first,
    );

    snapshot = await instance.collection('Tournament').get();
    final snapTournament = await snapshot.docs.first.reference.get();
    final tournament = snapTournament.data();
    expect(tournament!['state'], TournamentState.terminer.name);
  });
  test('add tournament', () async {
    await tournamentRepository.addTournamentInFirebase(tournament4);
    snapshot = await instance.collection('Tournament').get();
    expect(snapshot.docs.length, 4);
    final snapRounds = await instance
        .collection('Tournament')
        .doc(snapshot.docs.last.id)
        .collection('rounds')
        .get();
    expect(snapRounds.docs.length, tournament4.roundNumber);
  });
  test('modif tournament', () async {
    listTournaments.first.name = 'Name modifie';
    tournamentRepository.modifTournamentInFirebase(listTournaments.first);

    snapshot = await instance.collection('Tournament').get();
    final snapTournament = await snapshot.docs.first.reference.get();
    final tournament = snapTournament.data();
    expect(tournament!['name'], 'Name modifie');
  });
  test('delete tournament', () async {
    tournamentRepository.deleteTournamentInFirebase('id3');
    snapshot = await instance.collection('Tournament').get();

    expect(
      snapshot.docs.length,
      listTournaments.where((element) => element.documentId != 'id3').length,
    );
  });
  test('id tournament not null', () async {
    listTournaments.sort(
      (a, b) =>
          b.dateDebutTournois!.compareTo(a.dateDebutTournois ?? DateTime.now()),
    );
    expect(
      tournamentRepository.listTournaments(
        gameName: null,
        filter: const Filter(),
      ),
      emits(listTournaments.where((element) => element.documentId != null)),
    );
  });

  group('Changement automatique état des tournois', () {
    test('change state auto for start sign cup', () async {
      final nexDateInscription =
          DateTime(now.year, now.month, now.day, now.hour - 1);
      listTournaments[2].dateDebutInscription = nexDateInscription;
      tournamentRepository.checkTournamentState(listTournaments[2]);

      snapshot = await instance.collection('Tournament').get();
      final snapTournament = await snapshot.docs[2].reference.get();
      final tournament = snapTournament.data();
      expect(tournament!['state'], TournamentState.inscriptionOuverte.name);
    });
    test('change state auto for start cup', () async {
      final nexDateStart = DateTime(now.year, now.month, now.day, now.hour - 1);
      listTournaments[2].dateDebutTournois = nexDateStart;
      tournamentRepository.checkTournamentState(listTournaments[2]);
      snapshot = await instance.collection('Tournament').get();
      final snapTournament = await snapshot.docs[2].reference.get();
      final tournament = snapTournament.data();
      expect(tournament!['state'], TournamentState.enCours.name);
      tournamentRepository.checkTournamentState(listTournaments[2]);
    });
  });

  test('member is not sign', () async {
    const member = Member(uid: 'monUid');
    expect(tournamentRepository.memberIsSign(member, []), false);
  });
  test('member is sign', () async {
    const member = Member(uid: 'monUid');
    final listMemberTournament = [
      const MemberTournament(
        gamerTag: '',
        role: RoleType.leader,
        member: member,
      ),
    ];
    expect(
      tournamentRepository.memberIsSign(member, listMemberTournament),
      true,
    );
  });
}
