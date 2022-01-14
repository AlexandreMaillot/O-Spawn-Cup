enum TournamentState { incriptionOuverte,inscriptionFermer, enCours, annuler, terminer }

extension TournamentStateExt on TournamentState {
  String get state {
    switch (this) {
      case TournamentState.enCours:
        return "En cours";
      case TournamentState.annuler:
        return "Annuler";
      case TournamentState.terminer:
        return "Terminer";
        case TournamentState.inscriptionFermer:
        return "Inscription fermer";
        case TournamentState.incriptionOuverte:
        return "Inscription ouverte";
      default:
        return "";
    }
  }
}
