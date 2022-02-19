part of 'team_firestore_cubit.dart';


abstract class TeamFirestoreState extends Equatable {

  TeamFirestoreState();

}

class TeamFirestoreInitial extends TeamFirestoreState {
  TeamFirestoreInitial() : super();

  @override
  List<Object?> get props => [];
}

class TeamFirestoreSelected extends TeamFirestoreState {
  FirebaseStatusEvent status;
  int? indexSelect;
  TeamFirestoreSelected({required this.indexSelect,required this.status});
  @override
  List<int?> get props => [indexSelect];
}
class TeamFirestoreLoading extends TeamFirestoreState {
  TeamFirestoreLoading() : super();

  @override
  List<Object?> get props => [];

}
class TeamFirestoreLoaded extends TeamFirestoreState {
  List<Team> listTeam = [];
  FirebaseStatusEvent? status;
  TeamFirestoreLoaded({required this.listTeam,this.status}) : super();

  @override
  List<Object?> get props => [];
}
class TeamFirestoreRemoved extends TeamFirestoreState {
  TeamFirestoreRemoved() : super();

  @override
  List<Object?> get props => [];
}