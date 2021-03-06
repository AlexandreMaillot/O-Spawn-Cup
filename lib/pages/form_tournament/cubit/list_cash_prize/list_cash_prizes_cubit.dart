import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_cash_prizes_state.dart';

class ListCashPrizesCubit extends Cubit<ListCashPrizesState> {
  List<String> list = [];
  ListCashPrizesCubit({required List<String> listCashPrizes})
      : list = listCashPrizes,
        super(ListCashPrizesInitial(listCashPrizes));

  void addCashPrize(String value) {
    emit(ListCashPrizesLoad(list));
    if (value != '') {
      list.add(value);
    }
    emit(ListCashPrizesAdded(list));
  }

  void deleteCashPrizes(int index) {
    emit(ListCashPrizesLoad(list));
    list.removeAt(index);
    emit(ListCashPrizesDeleted(list));
  }

  void modifCashPrize(int index, String value) {
    emit(ListCashPrizesLoad(list));
    if (value != '' && list[index] != value) {
      list[index] = value;
    }
    emit(ListCashPrizesModified(list));
  }
}
