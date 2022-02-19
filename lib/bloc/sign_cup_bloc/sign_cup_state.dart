part of 'sign_cup_bloc.dart';

class SignCupState extends Equatable {
  final FormzStatus status;
  final GamerTag gamerTag;
  final TeamCode teamCode;

  const SignCupState({
    this.status = FormzStatus.pure,
    this.gamerTag = const GamerTag.pure(),
    this.teamCode = const TeamCode.pure(),
  });



  SignCupState copyWith({
    FormzStatus? status,
    GamerTag? gamerTag,
    TeamCode? teamCode,
  }) {
    return SignCupState(
      status: status ?? this.status,
      gamerTag: gamerTag ?? this.gamerTag,
      teamCode: teamCode ?? this.teamCode,
    );
  }
  @override
  List<Object> get props => [status,gamerTag,teamCode,];
}

