part of 'form_tournament_step_2_bloc.dart';

class FormTournamentStep2State extends Equatable {

  final FormzStatus status;
  final NameCup nameCup;
  final NumberRound numberRound;
  final Day daySign;
  final Month monthSign;
  final Years yearsSign;
  final Day dayStart;
  final Month monthStart;
  final Years yearsStart;
  final Hours hoursStart;
  final PlayerByTeam playerByTeam;
  final ServerType serverType;
  final NumberTeam numberTeam;

  const FormTournamentStep2State({
    this.status = FormzStatus.pure,
    this.nameCup = const NameCup.pure(),
    this.numberRound = const NumberRound.pure(),
    this.daySign = const Day.pure(),
    this.monthSign = const Month.pure(),
    this.yearsSign = const Years.pure(),

    this.dayStart = const Day.pure(),
    this.monthStart = const Month.pure(),
    this.yearsStart = const Years.pure(),
    this.hoursStart = const Hours.pure(),
    this.playerByTeam = const PlayerByTeam.pure(),
    this.serverType = const ServerType.pure(),
    this.numberTeam = const NumberTeam.pure(),
  });



  FormTournamentStep2State copyWith({
    FormzStatus? status,
    NameCup? nameCup,
    NumberRound? numberRound,
    Day? daySign,
    Month? monthSign,
    Years? yearsSign,
    Day? dayStart,
    Month? monthStart,
    Years? yearsStart,
    Hours? hoursStart,
    PlayerByTeam? playerByTeam,
    ServerType? serverType,
    NumberTeam? numberTeam,
  }) {
    return FormTournamentStep2State(
      status: status ?? this.status,
      nameCup: nameCup ?? this.nameCup,
      numberRound: numberRound ?? this.numberRound,
      daySign: daySign ?? this.daySign,
      monthSign: monthSign ?? this.monthSign,
      yearsSign: yearsSign ?? this.yearsSign,
      dayStart: dayStart ?? this.dayStart,
      monthStart: monthStart ?? this.monthStart,
      yearsStart: yearsStart ?? this.yearsStart,
      hoursStart: hoursStart ?? this.hoursStart,
      playerByTeam: playerByTeam ?? this.playerByTeam,
      serverType: serverType ?? this.serverType,
      numberTeam: numberTeam ?? this.numberTeam,
    );
  }
  @override
  List<Object> get props => [status,nameCup,numberRound,daySign,monthSign,yearsSign,dayStart,monthStart,yearsStart,hoursStart,playerByTeam,serverType,numberTeam];
}


