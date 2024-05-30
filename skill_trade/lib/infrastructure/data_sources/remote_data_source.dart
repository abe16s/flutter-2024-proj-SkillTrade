import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client httpClient;

  RemoteDataSource(this.httpClient);

  Future<Map<String, dynamic>> logIn(String endpoint, String role, String email, String password) async {
    final response = await httpClient.post(
      Uri.parse('http://$endpoint:9000/trader/signin'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"role": role, "email": email, "password": password}),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error logging in');
    }
  }

  Future<void> signUpCustomer(String endpoint, String email, String password, String phone, String fullName) async {
    final response = await httpClient.post(
      Uri.parse('http://$endpoint:9000/trader/signup'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"role": "customer", "email": email, "password": password, "phone": phone, "fullName": fullName}),
    );
    if (response.statusCode != 201) {
      throw Exception('Error signing up');
    }
  }

  Future<void> signUpTechnician(String endpoint, String email, String password, String phone, String fullName, String skills, String experience, String educationLevel, String availableLocation, String additionalBio) async {
    final response = await httpClient.post(
      Uri.parse('http://$endpoint:9000/trader/signup'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "role": "technician", "email": email, "password": password, "phone": phone, "fullName": fullName,
        "skills": skills, "experience": experience, "educationLevel": educationLevel, "availableLocation": availableLocation, "additionalBio": additionalBio
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Error signing up');
    }
  }
}
