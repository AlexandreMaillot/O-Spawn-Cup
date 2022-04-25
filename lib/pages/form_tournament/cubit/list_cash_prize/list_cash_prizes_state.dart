part of 'list_cash_prizes_cubit.dart';

abstract class ListCashPrizesState extends Equatable {
  final List<String> listCashPrizes;
  const ListCashPrizesState(this.listCashPrizes);

  @override
  List<Object> get props => [];
}

class ListCashPrizesInitial extends ListCashPrizesState {
  const ListCashPrizesInitial(List<String> l) : super(l);
}

class ListCashPrizesLoad extends ListCashPrizesState {
  const ListCashPrizesLoad(List<String> l) : super(l);
}

class ListCashPrizesAdded extends ListCashPrizesState {
  const ListCashPrizesAdded(List<String> l) : super(l);
}

class ListCashPrizesModified extends ListCashPrizesState {
  const ListCashPrizesModified(List<String> l) : super(l);
}

class ListCashPrizesDeleted extends ListCashPrizesState {
  const ListCashPrizesDeleted(List<String> l) : super(l);
}
