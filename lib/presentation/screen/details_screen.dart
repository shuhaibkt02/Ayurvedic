import 'package:ayurvedic/data/repo/patient/patient_repo.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              PatientRepositery repositery = PatientRepositery();
              await repositery.fetchPatient();
            },
            child: Icon(Icons.abc)),
      ),
    );
  }
}
