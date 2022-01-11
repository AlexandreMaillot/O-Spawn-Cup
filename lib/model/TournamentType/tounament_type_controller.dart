
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';

class TournamentTypeController {
  TournamentType? tournamentType;

  TournamentTypeController(this.tournamentType){
  }
  create(){

  }
  delete(){

  }
  // List<TournamentType> getTournamentType() {
  //   List<TournamentType> listTournament = [];
  //   tournamentTypeDao.collectionReference.get().then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       TournamentType.fromJson(doc.data() ! as Map<String, dynamic>);
  //       listTournament.add(TournamentType.fromJson(doc.data() ! as Map<String, dynamic>));
  //       // print();
  //     });
  //   });
  //   // tournamentType.
  //   // final allData = querySnapshot.docs.map((doc) => doc.data());
  //   // allData.forEach((element) {
  //   //
  //   //   TournamentType tournamentType = TournamentType(name: element., capacityTeam: capacityTeam);
  //   //   listTournament.add(TournamentType.fromJson());
  //   // });
  //   return listTournament;
  // }
}