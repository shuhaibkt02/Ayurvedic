part of 'patient_bloc.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}

final class PatientLoading extends PatientState {}

final class PatientLoaded extends PatientState {
  final List<PatientModel> patientData;

  PatientLoaded({required this.patientData});
}

final class PatientError extends PatientState {
  final String errorMessage;

  PatientError({required this.errorMessage});
}
