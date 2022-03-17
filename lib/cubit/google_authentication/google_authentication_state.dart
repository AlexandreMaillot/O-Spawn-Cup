part of 'google_authentication_cubit.dart';

abstract class GoogleAuthenticationState extends Equatable {
  const GoogleAuthenticationState();
}

class GoogleAuthenticationInitial extends GoogleAuthenticationState {
  @override
  List<Object> get props => [];
}
class GoogleAuthenticationLoad extends GoogleAuthenticationState {
  @override
  List<Object> get props => [];
}
class GoogleAuthenticationSuccess extends GoogleAuthenticationState {
  @override
  List<Object> get props => [];
}
class GoogleAuthenticationFailure extends GoogleAuthenticationState {
  String error;
  GoogleAuthenticationFailure({required this.error});
  @override
  List<Object> get props => [error];
}
