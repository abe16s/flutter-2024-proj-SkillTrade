import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_event.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_state.dart';

class IndividualTechnicianBloc extends Bloc<IndividualTechnicianEvent, IndividualTechnicianState> {
  IndividualTechnicianBloc() : super(IndividualTechnicianLoading()) {
    on<LoadIndividualTechnician>(_onLoadIndividualTechnician);
    on<UpdateTechnicianProfile>(_onUpdateTechnicianProfile);
  }

  Future<void> _onLoadIndividualTechnician(LoadIndividualTechnician event, Emitter<IndividualTechnicianState> emit) async {
    final headers = {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImZ1bGxOYW1lIjoiQWJlbmV6ZXIgU2VpZnUiLCJlbWFpbCI6ImFiZW5lemVyc2VpZnUxMjNAZ21haWwuY29tIiwicm9sZSI6ImN1c3RvbWVyIiwiaWF0IjoxNzEzNDY1NjQzLCJleHAiOjE3NDUwMjMyNDN9.lg-0KRLpcLGqE4jRV7wRQBRhI3IHh67v-fDH8bm8Cm8"};
    try {
      final response = await http
          .get(Uri.parse('http://localhost:9000/technician/${event.technicianId}'), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        data['id'] = event.technicianId;
        final technician = Technician.fromJson(data);
        emit(IndividualTechnicianLoaded(technician: technician));
      } else {
        emit(IndividualTechnicianError('Error fetching technician'));
      }
    } catch (error) {
      emit(IndividualTechnicianError(error.toString()));
    }
  }

  Future<void> _onUpdateTechnicianProfile(UpdateTechnicianProfile event, Emitter<IndividualTechnicianState> emit) async {
    final headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImZ1bGxOYW1lIjoiQWJlbmV6ZXIgU2VpZnUiLCJlbWFpbCI6Im15c3RlcnlhYmU0NTZAZ21haWwuY29tIiwicm9sZSI6InRlY2huaWNpYW4iLCJpYXQiOjE3MTY1MzYwMjQsImV4cCI6MTc0ODA5MzYyNH0.jfRNrCXIGHzKPgdV16ymAU7s_2FQMfQBcuboaDvAx00",
      "Content-Type": "application/json"
    };

    try {
      final response = await http.patch(Uri.parse('http://localhost:9000/technician/${event.technicianId}'), 
          headers: headers,
          body: json.encode(event.updates)
          );
      if (response.statusCode == 200) {
        print("Technician profile updated successfully");
        add(LoadIndividualTechnician(technicianId: event.technicianId));
      } else {
        print(response.statusCode);
        emit(IndividualTechnicianError('Error updating technician'));
      }
    } catch (error) {
      emit(IndividualTechnicianError(error.toString()));
    }
  }
}
