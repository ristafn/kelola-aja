part of 'kelola_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class KelolaAppState extends Equatable {
  const KelolaAppState._({
    required this.status,
    this.user = User.empty,
  });

  const KelolaAppState.authenticated(User user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );

  const KelolaAppState.unauthenticated()
      : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
