import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/technician.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final endpoint = "10.6.194.136";



class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> write(String key, value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(key) async {
    await _secureStorage.delete(key: key);
  }
}


final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});


final technicianProvider = FutureProvider<List<Technician>>( (ref) async {

  final secureStorageService = await ref.read(secureStorageProvider);

  final token = await secureStorageService.read("token");
  print("token $token");
    final response =
        await http.get(Uri.parse("http://$endpoint:9000/technician"), 
        headers: { 
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if(response.statusCode == 200){
      print("Yay");
    }
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data);
      var ans =  data.map((json) => Technician.fromJson(json)).toList();
      
     return ans;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load technicians.");
    }
  });



class AuthState {
  final bool isLoading;
  final String? token;
  final String? role;
  final String? errorMessage;
  final String? successMessage;

  AuthState({this.isLoading = false, this.role, this.successMessage,  this.token, this.errorMessage});
  bool get isLoggedIn => token != null;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final SecureStorageService _secureStorageService;

  AuthNotifier(this._secureStorageService) : super(AuthState()) {
    _loadToken();
  }

  

  // final _storage = FlutterSecureStorage();

  Future<void> signup(user) async {
    state = AuthState(isLoading: true);
    final response = await http.post(
      Uri.parse('http://$endpoint:9000/trader/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    print(response.body);

    if (response.statusCode == 201) {
      print("yay");
      state = AuthState(successMessage: "You have successfully signed up!");
    } else {
      print("Nay");
      state = AuthState(errorMessage: "Signup has failed.");
    }
  }

  Future<void> signin(String role, String email, String password) async {
    state = AuthState(isLoading: true);
    print("signing in");
    print("sign in inputs $role, $email, $password");
    try {
      final response = await http.post(
        Uri.parse('http://$endpoint:9000/trader/signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "role": role,
          "email": email,
          "password": password,
        }),
      );
      print("response ${response.body} $response");

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        final token = data['access_token'];

        // Save token securely
        await _secureStorageService.write("token", token);
        await _secureStorageService.write('role', data['role']);
        await _secureStorageService.write('userId', data['userId'].toString());
        state = AuthState(isLoading: false, token: token, role: role);

        // final storedToken = await _storage.read(key: 'token');
        // print('Stored Token: $storedToken');
      } else {
        state = AuthState(isLoading: false, errorMessage: 'Signin failed');
      }
    } catch (e) {
      state = AuthState(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> _loadToken() async {
    final token = await _secureStorageService.read("token");
    final role = await _secureStorageService.read("role");
    state = AuthState(token: token, role: role);
  }
  

  Future<void> logout() async {
    await _secureStorageService.delete("token");
    state = AuthState(token: null);
  }
}

// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
//   return AuthNotifier();
// });

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final secureStorageService = ref.read(secureStorageProvider);
  return AuthNotifier(secureStorageService);
});


