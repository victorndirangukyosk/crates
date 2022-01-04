part of 'login_cubit.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final PhoneAuthCredential phoneAuthCredential;

  LoginSuccess(this.phoneAuthCredential);
  @override
  List<Object?> get props => [phoneAuthCredential];
}

class LoginSuccessCode extends LoginState {
  final UserCredential userCredential;
  LoginSuccessCode(this.userCredential);
  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);
  @override
  List<Object?> get props => [error];
}
