import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'google_authentication_state.dart';

class GoogleAuthenticationCubit extends Cubit<GoogleAuthenticationState> {
  late final AuthenticationRepository _authenticationRepository;


  GoogleAuthenticationCubit({required AuthenticationRepository authenticationRepository}) : _authenticationRepository = authenticationRepository,
        super(GoogleAuthenticationInitial());

  Future<void> logInWithGoogle() async {
    emit(GoogleAuthenticationLoad());
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(GoogleAuthenticationSuccess());
    } on LogInWithGoogleFailure catch (error) {
      emit(GoogleAuthenticationFailure(error: error.message));
    } catch (error) {
      emit(GoogleAuthenticationFailure(error: error.toString()));
    }
  }
}
