import 'package:equatable/equatable.dart';

abstract class TechniciansEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadTechnicians extends TechniciansEvent {}

class LoadPendingTechnicians extends TechniciansEvent {}

class LoadSuspendedTechnicians extends TechniciansEvent {}