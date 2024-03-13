import 'package:ayurvedic/data/model/patient_model.dart';
import 'package:ayurvedic/data/repo/auth/auth_repo.dart';
import 'package:dio/dio.dart';

abstract class PatientService {
  Future<List<PatientModel>> fetchPatient();
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
}
