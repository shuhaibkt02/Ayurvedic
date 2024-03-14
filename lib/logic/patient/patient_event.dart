part of 'patient_bloc.dart';

@immutable
sealed class PatientEvent {}

final class LoadPateient extends PatientEvent {}
