import 'package:equatable/equatable.dart';

abstract class IndividualTechnicianEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadIndividualTechnician extends IndividualTechnicianEvent {
  final int? technicianId;

  LoadIndividualTechnician({required this.technicianId});
}


class UpdateTechnicianProfile extends IndividualTechnicianEvent {
  final Map<String, dynamic> updates;
  final int technicianId;

  UpdateTechnicianProfile({required this.updates, required this.technicianId,});
}
