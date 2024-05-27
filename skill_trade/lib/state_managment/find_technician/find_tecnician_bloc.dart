import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/state_managment/find_technician/find_tecnician_event.dart';
import 'package:skill_trade/state_managment/find_technician/find_tecnician_state.dart';
import 'package:skill_trade/storage.dart';

class TechniciansBloc extends Bloc<TechniciansEvent, TechniciansState> {
  TechniciansBloc() : super(TechniciansLoading()) {
    on<LoadTechnicians>(_onLoadTechnicians);
  }

  String? endpoint;
  String? token;
  String? id;


  Future<void> loadStorage() async {
    endpoint = await SecureStorage.instance.read("endpoint");
    token = await SecureStorage.instance.read("token");
    id = await SecureStorage.instance.read("id");
  }

  Future<void> _onLoadTechnicians(LoadTechnicians event, Emitter<TechniciansState> emit) async {    
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .get(Uri.parse('http://$endpoint:9000/technician'), headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final technicians = data.map((json) {
          return Technician.fromJson(json);
        }).toList();
        emit(TechniciansLoaded(technicians));
      } else {
        print("error fetching");
        emit(TechniciansError('Error fetching technicians'));
      }
    } catch (error) {
      print("error");
      emit(TechniciansError(error.toString()));
    }
  }
}
