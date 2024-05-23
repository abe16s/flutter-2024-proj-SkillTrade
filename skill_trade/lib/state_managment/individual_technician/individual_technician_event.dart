abstract class IndividualTechnicianEvent {}

class LoadIndividualTechnician extends IndividualTechnicianEvent {
  final int technicianId;

  LoadIndividualTechnician({required this.technicianId});
}