import 'package:equatable/equatable.dart';


abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnLogged extends AuthState {}

class LoggedIn extends AuthState {
  final String? role;

  LoggedIn({required this.role});
}

class SignUpState extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}

class AuthSuccess extends AuthState {
  final String success;
  AuthSuccess(this.success);
}