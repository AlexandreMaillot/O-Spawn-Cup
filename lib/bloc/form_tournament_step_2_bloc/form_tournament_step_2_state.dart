part of "form_tournament_step_2_bloc.dart";

class FormTournamentStep2State extends Equatable {

  final FormzStatus status;
  final NameCup nameCup;
  final NumberRound numberRound;
  final Day day;
  final Month month;
  final Years years;
  final PlayerByTeam playerByTeam;
  final ServerType serverType;
  final NumberTeam numberTeam;

  const FormTournamentStep2State({
    this.status = FormzStatus.pure,
    this.nameCup = const NameCup.pure(),
    this.numberRound = const NumberRound.pure(),
    this.day = const Day.pure(),
    this.month = const Month.pure(),
    this.years = const Years.pure(),
    this.playerByTeam = const PlayerByTeam.pure(),
    this.serverType = const ServerType.pure(),
    this.numberTeam = const NumberTeam.pure(),
  });



  FormTournamentStep2State copyWith({
    FormzStatus? status,
    NameCup? nameCup,
    NumberRound? numberRound,
    Day? day,
    Month? month,
    Years? years,
    PlayerByTeam? playerByTeam,
    ServerType? serverType,
    NumberTeam? numberTeam,
  }) {
    return FormTournamentStep2State(
      status: status ?? this.status,
      nameCup: nameCup ?? this.nameCup,
      numberRound: numberRound ?? this.numberRound,
      day: day ?? this.day,
      month: month ?? this.month,
      years: years ?? this.years,
      playerByTeam: playerByTeam ?? this.playerByTeam,
      serverType: serverType ?? this.serverType,
      numberTeam: numberTeam ?? this.numberTeam,
    );
  }
  @override
  List<Object> get props => [status,nameCup,numberRound,day,month,years,playerByTeam,serverType,numberTeam];
}


