enum TournamentState { inscriptionOuverte,inscriptionFermer, enCours, annuler, terminer,complet }

extension TournamentStateExt on TournamentState {
  String get state {
    switch (this) {
      case TournamentState.enCours:
        return 'En cours';
      case TournamentState.annuler:
        return 'Annuler';
      case TournamentState.terminer:
        return 'Terminer';
        case TournamentState.inscriptionFermer:
        return 'Inscription fermer';
        case TournamentState.inscriptionOuverte:
        return 'Inscription ouverte';
      case TournamentState.complet:
        return 'Complet';
      default:
        return '';
    }
  }
}
