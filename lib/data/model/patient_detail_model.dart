import 'package:flutter/material.dart';

@immutable
class PatientDetailModel {
  final int id;
  final String male;
  final String female;
  final int patient;
  final int treatment;
  final String treatmentName;

  const PatientDetailModel({
    required this.id,
    required this.male,
    required this.female,
    required this.patient,
    required this.treatment,
    required this.treatmentName,
  });

  factory PatientDetailModel.fromJson(Map<String, dynamic> json) {
    return PatientDetailModel(
      id: json['id'] ?? 0,
      male: json['male'] ?? '',
      female: json['female'] ?? '',
      patient: json['patient'] ?? 0,
      treatment: json['treatment'] ?? 0,
      treatmentName: json['treatment_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'male': male,
      'female': female,
      'patient': patient,
      'treatment': treatment,
      'treatment_name': treatmentName,
    };
  }

  PatientDetailModel copyWith({
    int? id,
    String? male,
    String? female,
    int? patient,
    int? treatment,
    String? treatmentName,
  }) {
    return PatientDetailModel(
      id: id ?? this.id,
      male: male ?? this.male,
      female: female ?? this.female,
      patient: patient ?? this.patient,
      treatment: treatment ?? this.treatment,
      treatmentName: treatmentName ?? this.treatmentName,
    );
  }
}
