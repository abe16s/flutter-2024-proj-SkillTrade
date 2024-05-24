import 'package:skill_trade/presentation/widgets/technician_application.dart';

class Technician{ 
  final String name, speciality;
  final String role = "technician";
  String email, phone, password, experience, educationLevel, availableLocation, additionalBio;

  Technician({required this.name, required this.speciality, this.email = "", this.phone = "", this.password = "", this.availableLocation = "", this.additionalBio = "", this.educationLevel = "", this.experience = ""});


  factory Technician.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'fullName': String name,
        'skills': String speciality,
        'id': int id,

      } =>

        Technician(
          name: name,
          speciality: speciality
        ),
      _ => throw const FormatException('Failed to load technician.'),
    };
  }

  toJson(){ 
    return ( 
      { 
      "fullName": name,
      "skills": speciality,
      "email": email,
      "password": password,
      "phone": phone,
      "role": role,
      "additionalBio": additionalBio,
      "educationLevel": educationLevel,
      "availableLocation": availableLocation

      }
    );
  }


}