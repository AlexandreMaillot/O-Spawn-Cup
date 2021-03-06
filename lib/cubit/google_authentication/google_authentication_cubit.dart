import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

part 'google_authentication_state.dart';

class GoogleAuthenticationCubit extends Cubit<GoogleAuthenticationState> {
  late final AuthenticationRepository _authenticationRepository;
  late MemberRepository memberRepository;

  @override
  Future<void> close() {
    return super.close();
  }

  GoogleAuthenticationCubit({
    required AuthenticationRepository authenticationRepository,
    required this.memberRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(GoogleAuthenticationInitial());

  Future<void> logInWithGoogle() async {
    emit(GoogleAuthenticationLoad());
    try {
      await _authenticationRepository.logInWithGoogle();
      await Future.delayed(const Duration(milliseconds: 500));
      if (await memberRepository
              .currentMember(_authenticationRepository.currentUser.id)
              .first ==
          null) {
        await Future.delayed(const Duration(milliseconds: 500));
        await memberRepository.addMember(
          Member(
            uid: _authenticationRepository.currentUser.id,
            pseudo: _authenticationRepository.currentUser.name!,
            isAdmin: false,
          ),
        );
      }

      // emit(GoogleAuthenticationSuccess());
    } on LogInWithGoogleFailure catch (error) {
      emit(GoogleAuthenticationFailure(error: error.message));
    } catch (error) {
      throw ArgumentError(error.toString());
    }
  }
}
