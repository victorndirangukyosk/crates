part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthStateUnauthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateError extends AuthState {
  final String error;

  AuthStateError(this.error);
  @override
  List<Object> get props => [error];
}

class AuthStateAwaitCode extends AuthState {
  final ConfirmationResult result;

  AuthStateAwaitCode(this.result);
  @override
  List<Object> get props => [result];
}

class AuthStateCodeVerified extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateAuthenticated extends AuthState {
  final fb.UserCredential userInfo;

  AuthStateAuthenticated(this.userInfo);

  @override
  List<Object> get props => [userInfo];
}
