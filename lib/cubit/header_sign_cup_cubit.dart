import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/Tournament/tournament.dart';
import '../service/firebase_handler.dart';

part 'header_sign_cup_state.dart';

class HeaderSignCupCubit extends Cubit<HeaderSignCupState> {
  HeaderSignCupCubit() : super(HeaderSignCupInitial());

  closeCup(Tournament tournament) {
    FirebaseHandler().cupClose(tournament);
    emit(HeaderSignCupStateChange(tournament: tournament));
  }
}
