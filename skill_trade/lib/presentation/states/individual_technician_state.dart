import 'package:skill_trade/domain/models/technician.dart';

abstract class IndividualTechnicianState {}

class IndividualTechnicianLoading extends IndividualTechnicianState {}

class IndividualTechnicianLoaded extends IndividualTechnicianState {
  final Technician technician;
  IndividualTechnicianLoaded({required this.technician});
}

class IndividualTechnicianError extends IndividualTechnicianState {
  final String error;
  IndividualTechnicianError(this.error);
}