import 'dart:developer';

import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/data/model/patient_model.dart';
import 'package:ayurvedic/data/model/treatment_model.dart';
import 'package:ayurvedic/data/repo/auth/auth_repo.dart';
import 'package:dio/dio.dart';

abstract class PatientService {
  Future<List<PatientModel>> fetchPatient();
  Future<List<BranchModel>> fetchBranches();
  Future<List<TreatmentModel>> fetchTreatments();
  Future<void> updatePatient({required PatientModel patient});
}

class PatientRepositery implements PatientService {
  final Dio dio = Dio();
  String baseUri = 'https://flutter-amr.noviindus.in/api';

  @override
  Future<List<PatientModel>> fetchPatient() async {
    try {
      final token = await AuthRepository().loadToken();
      var headers = {'Authorization': 'Bearer $token'};

      final response = await dio.get('$baseUri/PatientList',
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('patient')) {
          final patientJsonList = responseData['patient'] as List<dynamic>;

          final patientData = patientJsonList
              .map((patient) => PatientModel.fromJson(patient))
              .toList();
          return patientData;
        } else {
          throw Exception('Error: Response does not contain a "patient" key.');
        }
      } else {
        throw Exception('Error: Unexpected status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching patient data: $e');
    }
  }

  @override
  Future<List<BranchModel>> fetchBranches() async {
    try {
      final token = await AuthRepository().loadToken();
      var headers = {'Authorization': 'Bearer $token'};

      final response = await dio.get('$baseUri/BranchList',
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('branches')) {
          final branchesJsonList = responseData['branches'] as List<dynamic>;

          final branchData = branchesJsonList
              .map((branch) => BranchModel.fromJson(branch))
              .toList();
          return branchData;
        } else {
          throw Exception('Error: Response does not contain a "patient" key.');
        }
      } else {
        throw Exception('Error: Unexpected status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching patient data: $e');
    }
  }

  @override
  Future<List<TreatmentModel>> fetchTreatments() async {
    try {
      final token = await AuthRepository().loadToken();
      var headers = {'Authorization': 'Bearer $token'};

      final response = await dio.get('$baseUri/TreatmentList',
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('treatments')) {
          final treatmentsJsonList =
              responseData['treatments'] as List<dynamic>;

          final treatmentData = treatmentsJsonList
              .map((treatment) => TreatmentModel.fromJson(treatment))
              .toList();
          return treatmentData;
        } else {
          throw Exception('Error: Response does not contain a "patient" key.');
        }
      } else {
        throw Exception('Error: Unexpected status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching patient data: $e');
    }
  }

  @override
  Future<void> updatePatient({required PatientModel patient}) async {
    final token = await AuthRepository().loadToken();
    var headers = {'Authorization': 'Bearer $token'};

    FormData formData = FormData.fromMap({
      'name': patient.name,
      'executive': patient.user,
      'payment': patient.payment,
      'address': patient.address,
      'total_amount': patient.totalAmount,
      'discount_amount': patient.discountAmount,
      'advance_amount': patient.advanceAmount,
      'balance_amount': patient.balanceAmount,
      'date_nd_time': patient.dateAndTime,
      'id': '',
      'male': patient.patientDetailList.map((e) => e.male),
      'female': patient.patientDetailList.map((e) => e.female),
      'branch': patient.branch,
      'treatments': patient.patientDetailList.map((e) => e.id),
    });

    Response response = await dio.post('$baseUri/PatientUpdate',
        data: formData, options: Options(headers: headers));

    final responseData = response.data as Map<String, dynamic>;

    log('$responseData');
  }
}
