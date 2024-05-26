import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/state_managment/auth/auth_event.dart';
import 'package:skill_trade/state_managment/auth/auth_state.dart';
import 'package:skill_trade/storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnLogged()) {
    on<AutomaticLogIn>(_onAutomaticLogIn);
    on<LogInEvent>(_onLogIn);
    on<SignUpCustomer>(_onSignUpCustomer);
    on<SignUpTechnician>(_onSignUpTechnician);
    on<UnlogEvent>(_onUnlogEvent);
    add(AutomaticLogIn());
  }

  Future<void> _onAutomaticLogIn(AutomaticLogIn event, Emitter<AuthState> emit) async {
    await SecureStorage.instance.init();
    String? token = await SecureStorage.instance.read("token");
    if (token != null) {
      emit(LoggedIn(role: await SecureStorage.instance.read("role")));
    }
  }
  
  String? endpoint;


  Future<void> loadStorage() async {
    endpoint = await SecureStorage.instance.read("endpoint");
  }

  Future<void> _onLogIn(LogInEvent event, Emitter<AuthState> emit) async {
    await loadStorage();

    print(endpoint);
    final headers = {"Content-Type": "application/json"};
    try {
      final response = await http.post(Uri.parse('http://$endpoint:9000/trader/signin'), 
          headers: headers,
          body: json.encode({
            "role": event.role, "email": event.email, "password": event.password
          })
          );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print(data);
        await SecureStorage.instance.write("token", data["access_token"]);
        await SecureStorage.instance.write("role", data["role"]);
        await SecureStorage.instance.write("id", data["userId"].toString());
        emit(LoggedIn(role: data["role"]));
      } else {
        print("fetch error");
        emit(AuthError('Error logging user'));
      }
    } catch (error) {
      print("error");
      emit(AuthError(error.toString()));
    }
  }

  Future<void> _onSignUpCustomer(SignUpCustomer event, Emitter<AuthState> emit) async {
    await loadStorage();
    final headers = {"Content-Type": "application/json"};
    try {
      final response = await http.post(Uri.parse('http://$endpoint:9000/trader/signup'), 
          headers: headers,
          body: json.encode({
            "role": "customer", "email": event.email, "password": event.password, "phone":event.phone, "fullName": event.fullName
          })
          );

      if (response.statusCode == 201) {
        print("Successfully registered");
        add(LogInEvent(role: "customer", email: event.email, password: event.password));
      } else {
        print("fetch error");
        print("A user with that email already exists! Please try Login");
        emit(AuthError('Error logging user'));
      }
    } catch (error) {
      print("error");
      emit(AuthError(error.toString()));
    }
  }

  Future<void> _onSignUpTechnician(SignUpTechnician event, Emitter<AuthState> emit) async {
    await loadStorage();
    final headers = {"Content-Type": "application/json"};
    try {
      print(endpoint);
      final response = await http.post(Uri.parse('http://$endpoint:9000/trader/signup'), 
          headers: headers,
          body: json.encode({
            "role": "technician", "email": event.email, "password": event.password, "phone":event.phone, "fullName": event.fullName,
            "skills": event.skills, "experience": event.experience, "educationLevel": event.educationLevel, "availableLocation": event.availableLocation, "additionalBio": event.additionalBio 
            })
          );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print(data);
        print("Successfully applied");
      } else {
        print("fetch error");
        print("A user with that email already exists! Please try Login");
        emit(AuthError('Error logging user'));
      }
    } catch (error) {
      print("error");
      emit(AuthError(error.toString()));
    }
  }

  Future<void> _onUnlogEvent(UnlogEvent event, Emitter<AuthState> emit) async {
    await SecureStorage.instance.write("token", null);
    await SecureStorage.instance.write("role", null);
    await SecureStorage.instance.write("id", null);
    emit(UnLogged());
  }
}
