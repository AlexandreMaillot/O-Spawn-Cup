part of 'team_firestore_cubit.dart';

abstract class TeamFirestoreState extends Equatable {
  List<Team> listTeam = [];
  TeamFirestoreState(this.listTeam);
  @override
  List<Object> get props => [listTeam];
}

class TeamFirestoreInitial extends TeamFirestoreState {
  TeamFirestoreInitial(List<Team> listTeam) : super(listTeam);

}
class TeamFirestoreLoading extends TeamFirestoreState {
  TeamFirestoreLoading(List<Team> listTeam) : super(listTeam);
}
class TeamFirestoreLoaded extends TeamFirestoreState {
  TeamFirestoreLoaded(List<Team> listTeam) : super(listTeam);
}
