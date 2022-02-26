part of 'list_cash_prizes_cubit.dart';

abstract class ListCashPrizesState extends Equatable {

  List<String> listCashPrizes;
  ListCashPrizesState(this.listCashPrizes);

  @override
  List<Object> get props => [];
}

class ListCashPrizesInitial extends ListCashPrizesState {
  ListCashPrizesInitial(List<String> l) : super(l);

}
class ListCashPrizesLoad extends ListCashPrizesState {
  ListCashPrizesLoad(List<String> l) : super(l);
}
class ListCashPrizesAdded extends ListCashPrizesState {
  ListCashPrizesAdded(List<String> l) : super(l);
}
class ListCashPrizesModified extends ListCashPrizesState {
  ListCashPrizesModified(List<String> l) : super(l);
}
class ListCashPrizesDeleted extends ListCashPrizesState {
  ListCashPrizesDeleted(List<String> l) : super(l);
}