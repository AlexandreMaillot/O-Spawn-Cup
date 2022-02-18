part of 'team_firestore_cubit.dart';

abstract class TeamFirestoreState extends Equatable {

  TeamFirestoreState();

}

class TeamFirestoreInitial extends TeamFirestoreState {
  TeamFirestoreInitial() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TeamFirestoreSelected extends TeamFirestoreState {
  int? indexSelect;
  TeamFirestoreSelected({required this.indexSelect});
  @override
  List<int?> get props => [indexSelect];
}
class TeamFirestoreLoading extends TeamFirestoreState {
  TeamFirestoreLoading() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class TeamFirestoreLoaded extends TeamFirestoreState {
  List<Team> listTeam = [];

  TeamFirestoreLoaded({required this.listTeam,}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class TeamFirestoreRemoved extends TeamFirestoreState {
  TeamFirestoreRemoved() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}