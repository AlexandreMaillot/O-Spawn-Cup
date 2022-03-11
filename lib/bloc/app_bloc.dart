import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/service/authentification.dart';
import 'package:o_spawn_cup/models/Member/member.dart';

part 'app_event.dart';
part 'app_state.dart';

// class AppBloc extends Bloc<AppEvent, AppState> {
//   final AuthenticationRepository _authenticationRepository;
//   AppBloc({required AuthenticationRepository authenticationRepository})
//       : _authenticationRepository = authenticationRepository,
//         super(authenticationRepository.currentUser.isNotEmpty
//           ? AppState.authenticated(authenticationRepository.currentUser)
//             : const AppState.unauthenticated(),
//       ) {
//     on<AppUserChanged>(_onUserChanged);
//     on<AppLogoutRequested>(_onLogoutRequested);
//     _userSubscription = _authenticationRepository.user.listen(
//           (user) => add(AppUserChanged(user)),
//     );
//   }
// }
