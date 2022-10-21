import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'kelola_event.dart';
part 'kelola_state.dart';

class KelolaAppBloc extends Bloc<KelolaAppEvent, KelolaAppState> {
  KelolaAppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? KelolaAppState.authenticated(
                  authenticationRepository.currentUser)
              : const KelolaAppState.unauthenticated(),
        ) {
    on<KelolaAppUserChanged>(_onUserChanged);
    on<KelolaAppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(KelolaAppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(
      KelolaAppUserChanged event, Emitter<KelolaAppState> emit) {
    emit(
      event.user.isNotEmpty
          ? KelolaAppState.authenticated(event.user)
          : const KelolaAppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(
      KelolaAppLogoutRequested event, Emitter<KelolaAppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
