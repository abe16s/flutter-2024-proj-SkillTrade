abstract class AuthEvent {}

class SignUpCustomer extends AuthEvent {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  SignUpCustomer({required this.fullName, required this.email, required this.phone, required this.password});
}

class SignUpTechnician extends AuthEvent {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String skills;
  final String experience;
  final String educationLevel;
  final String availableLocation;
  final String additionalBio;

  SignUpTechnician({required this.fullName, required this.email, required this.phone, required this.password, required this.skills, required this.experience, required this.educationLevel, required this.availableLocation, required this.additionalBio});

}

class LogInEvent extends AuthEvent {
  final String role;
  final String email;
  final String password;

  LogInEvent({required this.role, required this.email, required this.password});
}

class UnlogEvent extends AuthEvent {}

class AutomaticLogIn extends AuthEvent {}

class DeleteAccount extends AuthEvent {}
