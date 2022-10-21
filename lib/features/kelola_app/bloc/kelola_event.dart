part of 'kelola_bloc.dart';

abstract class KelolaAppEvent extends Equatable {
  const KelolaAppEvent();

  @override
  List<Object> get props => [];
}

class KelolaAppLogoutRequested extends KelolaAppEvent {}

class KelolaAppUserChanged extends KelolaAppEvent {
  @visibleForTesting
  const KelolaAppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
