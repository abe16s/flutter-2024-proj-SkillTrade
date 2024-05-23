import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/state_managment/find_technician/find_tecnician_event.dart';
import 'package:skill_trade/state_managment/find_technician/find_tecnician_state.dart';

class TechniciansBloc extends Bloc<TechniciansEvent, TechniciansState> {
  TechniciansBloc() : super(TechniciansLoading()) {
    on<LoadTechnicians>(_onLoadTechnicians);
  }

  Future<void> _onLoadTechnicians(LoadTechnicians event, Emitter<TechniciansState> emit) async {
    final headers = {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImZ1bGxOYW1lIjoiQWJlbmV6ZXIgU2VpZnUiLCJlbWFpbCI6ImFiZW5lemVyc2VpZnUxMjNAZ21haWwuY29tIiwicm9sZSI6ImN1c3RvbWVyIiwiaWF0IjoxNzEzNDY1NjQzLCJleHAiOjE3NDUwMjMyNDN9.lg-0KRLpcLGqE4jRV7wRQBRhI3IHh67v-fDH8bm8Cm8"};
    try {
      final response = await http
          .get(Uri.parse('http://localhost:9000/technician'), headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final technicians = data.map((json) {
          json["email"] = "";
          json["phone"] = "";
          return Technician.fromJson(json);
        }).toList();
        emit(TechniciansLoaded(technicians));
      } else {
        emit(TechniciansError('Error fetching technicians'));
      }
    } catch (error) {
      emit(TechniciansError(error.toString()));
    }
  }
}
