import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_stat_state.dart';

class ShowStatCubit extends Cubit<ShowStatState> {
  ShowStatCubit() : super(ShowStatInitial());

  changeStatShow(bool globalStat){
    emit(ShowStatChanged(globalStat));
  }
}
