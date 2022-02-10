part of "form_tournament_bloc.dart";

class FormTournamentState extends Equatable {

  final FormzStatus status;
  final NameCup nameCup;
  final NumberRound numberRound;
  final Day day;
  final Month month;
  final Years years;
  final PlayerByTeam playerByTeam;
  final ServerType serverType;

  const FormTournamentState({
    this.status = FormzStatus.pure,
    this.nameCup = const NameCup.pure(),
    this.numberRound = const NumberRound.pure(),
    this.day = const Day.pure(),
    this.month = const Month.pure(),
    this.years = const Years.pure(),
    this.playerByTeam = const PlayerByTeam.pure(),
    this.serverType = const ServerType.pure(),
  });



  FormTournamentState copyWith({
    FormzStatus? status,
    NameCup? nameCup,
    NumberRound? numberRound,
    Day? day,
    Month? month,
    Years? years,
    PlayerByTeam? playerByTeam,
    ServerType? serverType,
  }) {
    return FormTournamentState(
      status: status ?? this.status,
      nameCup: nameCup ?? this.nameCup,
      numberRound: numberRound ?? this.numberRound,
      day: day ?? this.day,
      month: month ?? this.month,
      years: years ?? this.years,
      playerByTeam: playerByTeam ?? this.playerByTeam,
      serverType: serverType ?? this.serverType,
    );
  }
  @override
  List<Object> get props => [status,nameCup,numberRound,day,month,years,playerByTeam,serverType];
}


