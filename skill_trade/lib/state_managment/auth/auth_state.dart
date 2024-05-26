abstract class AuthState {}

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