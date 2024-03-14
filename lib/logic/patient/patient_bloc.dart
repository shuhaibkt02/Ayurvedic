import 'package:ayurvedic/data/model/patient_model.dart';
import 'package:ayurvedic/data/repo/patient/patient_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientRepositery patientRepositery;
  PatientBloc({required this.patientRepositery}) : super(PatientInitial()) {
    on<LoadPateient>((event, emit) async {
      emit(PatientLoading());
      try {
        List<PatientModel> patientData = await patientRepositery.fetchPatient();
        emit(PatientLoaded(patientData: patientData));
      } catch (e) {
        emit(PatientError(errorMessage: '$e'));
      }
    });
  }
}
