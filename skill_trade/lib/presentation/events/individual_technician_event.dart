abstract class IndividualTechnicianEvent {}

class LoadIndividualTechnician extends IndividualTechnicianEvent {
  final int? technicianId;

  LoadIndividualTechnician({required this.technicianId});
}


class UpdateTechnicianProfile extends IndividualTechnicianEvent {
  final Map<String, dynamic> updates;
  final int technicianId;

  UpdateTechnicianProfile({required this.updates, required this.technicianId,});
}

class UpdatePassword extends IndividualTechnicianEvent {
  final int id;
  final String role;
  final String oldPassword;
  final String newPassword;

  UpdatePassword({required this.id, required this.role, required this.oldPassword, required this.newPassword});
}