import "package:fake_cloud_firestore/fake_cloud_firestore.dart";
import "package:o_spawn_cup/models/Member/member.dart";
import "package:o_spawn_cup/models/MemberTournament/member_tournament.dart";
import "package:o_spawn_cup/models/Team/team.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/models/TournamentType/tournament_type.dart";
import "package:o_spawn_cup/models/game_name.dart";
import "package:o_spawn_cup/models/role_type.dart";
import "package:o_spawn_cup/models/server_type.dart";
import "package:o_spawn_cup/repository/member_tounament_repository.dart";
import "package:test/test.dart";

void main() {
  DateTime now = DateTime.now();
  late FakeFirebaseFirestore instance;
  late MemberTournamentRepository memberTournamentRepository;
  late TournamentCollectionReference tournamentsRef;
  late TeamCollectionReference teamsRef;
  late MemberTournamentCollectionReference memberTournamentsRef;
  late List<Team> listTeam = [Team(name: "MyTeam1"),Team(name: "MyTeam2"),Team(name: "MyTeam3")];
  late MemberTournament memberTournament = MemberTournament(gamerTag: "", role: RoleType.player, member: Member(uid: ""));

  Tournament tournament4 = Tournament(name: "Tournois 4",
      dateDebutTournois: DateTime(now.year,now.month,now.day + 7),
      game: GameName.LeagueOfLegend,
      server: ServerType.EU,
      tournamentType: TournamentType.quintet,
      capacity: 33,
      roundNumber: 3,
      dateDebutInscription: DateTime(now.year,now.month + 1,now.day + 7),
      killPointTournament: 1,
      pointPerRangTournament: 1,
      rangStartTournament: 15,
      cashPrize: ["Mon lot 1","Mon lot 2","Mon lot 3"],
      listCodesGames: ["MonCode1","MonCode2","MonCode3",]);

  setUp(() async {
    instance = FakeFirebaseFirestore();
    tournament4.documentId = "id4";
    await instance.collection("Tournament").doc("id4").set(tournament4.toJson());
    tournamentsRef = TournamentCollectionReference(instance);
    listTeam[0].documentId = "id1";
    listTeam[1].documentId = "id2";
    listTeam[2].documentId = "id3";
    listTeam[0].teamCode = "1234";
    tournamentsRef.doc("id4").teams.doc("id1").set(listTeam[0]);
    tournamentsRef.doc("id4").teams.doc("id2").set(listTeam[1]);
    tournamentsRef.doc("id4").teams.doc("id3").set(listTeam[2]);


    teamsRef = TeamCollectionReference(tournamentsRef.doc("id4").reference);
    memberTournamentsRef = MemberTournamentCollectionReference(teamsRef.doc("id1").reference);
    memberTournamentRepository = MemberTournamentRepository(memberTournamentCollectionReference: memberTournamentsRef);
  });
  test("load tournament", () async {
    memberTournamentRepository.loadTournament();
    expect(memberTournamentRepository.tournament, tournament4);
  });
  test("check team is full", () async {
    print("ok");
    expect(await memberTournamentRepository.checkTeamCapacity(listTeam[2]), false);
  });
  test("check team is not full", () async {
    expect(await memberTournamentRepository.checkTeamCapacity(listTeam[0]), true);
  });
  test("add member in team", () async {
    var membersTournament = await tournamentsRef.doc("id4").teams.doc(listTeam[0].documentId).membersTournament.get();
    var initalNum = membersTournament.docs.length;
    memberTournamentRepository.addMemberInTeam(const Member(uid: ""), "MonGameTag", RoleType.leader);
    membersTournament = await tournamentsRef.doc("id4").teams.doc(listTeam[0].documentId).membersTournament.get();
    expect(membersTournament.docs.length,initalNum + 1);
  });

  test("delete memberTournament in team", () async {
    // var membersTournament = await tournamentsRef.doc("id4").teams.doc(listTeam[0].documentId).membersTournament.get();
    // var initalNum = membersTournament.docs.length;
    // teamRepository.deleteMemberTournament()
    // expect(membersTournament.docs.length,initalNum + 1);
  });
  test("delete in no member", () {

  });
  test("id memberTournament not null", () {

  });
}