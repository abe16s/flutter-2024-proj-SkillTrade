import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_event.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_state.dart';
import 'package:skill_trade/storage.dart';

class IndividualTechnicianBloc extends Bloc<IndividualTechnicianEvent, IndividualTechnicianState> {
  IndividualTechnicianBloc() : super(IndividualTechnicianLoading()) {
    on<LoadIndividualTechnician>(_onLoadIndividualTechnician);
    on<UpdateTechnicianProfile>(_onUpdateTechnicianProfile);
  }

  String? endpoint;
  String? token;
  String? id;


  Future<void> loadStorage() async {
    endpoint = await SecureStorage.instance.read("endpoint");
    token = await SecureStorage.instance.read("token");
    id = await SecureStorage.instance.read("id");
  }

  Future<void> _onLoadIndividualTechnician(LoadIndividualTechnician event, Emitter<IndividualTechnicianState> emit) async {    
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .get(Uri.parse('http://$endpoint:9000/technician/${event.technicianId}'), headers: headers);
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
    await loadStorage();
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };

    try {
      final response = await http.patch(Uri.parse('http://$endpoint:9000/technician/${event.technicianId}'), 
          headers: headers,
          body: json.encode(event.updates)
          );
      if (response.statusCode == 200) {
        print("Technician profile updated successfully");
        add(LoadIndividualTechnician(technicianId: event.technicianId));
      } else {
        print(token);
        print(event.updates);
        print("http://$endpoint:9000/technician/${event.technicianId}");
        print(response.statusCode);
        emit(IndividualTechnicianError('Error updating technician'));
      }
    } catch (error) {
      emit(IndividualTechnicianError(error.toString()));
    }
  }
}
