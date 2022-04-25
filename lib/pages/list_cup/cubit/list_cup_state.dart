part of 'list_cup_cubit.dart';

abstract class ListCupState extends Equatable {
  const ListCupState();
}

class ListCupLoad extends ListCupState {
  @override
  List<Object> get props => [];
}

class ListCupFiltred extends ListCupState {
  @override
  List<Object> get props => [];
}

class ListCupNoData extends ListCupState {
  @override
  List<Object> get props => [];
}

class ListCupLoaded extends ListCupState {
  final List<Tournament> listCup;
  const ListCupLoaded({required this.listCup});
  @override
  List<Object> get props => [listCup];
}
