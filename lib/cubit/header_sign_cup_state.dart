part of 'header_sign_cup_cubit.dart';

abstract class HeaderSignCupState extends Equatable {
  const HeaderSignCupState();
}

class HeaderSignCupInitial extends HeaderSignCupState {
  @override
  List<Object> get props => [];
}
class HeaderSignCupStateChange extends HeaderSignCupState {
  Tournament tournament;
  HeaderSignCupStateChange({required this.tournament});
  @override
  List<Object> get props => [tournament.state];
}
