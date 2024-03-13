import 'package:flutter/material.dart';

@immutable
class BranchModel {
  final int id;
  final String name;
  final int patientsCount;
  final String location;
  final String phone;
  final String mail;
  final String address;
  final String gst;
  final bool isActive;

  const BranchModel({
    required this.id,
    required this.name,
    required this.patientsCount,
    required this.location,
    required this.phone,
    required this.mail,
    required this.address,
    required this.gst,
    required this.isActive,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      patientsCount: json['patients_count'] ?? 0,
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      mail: json['mail'] ?? '',
      address: json['address'] ?? '',
      gst: json['gst'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'patients_count': patientsCount,
  //     'location': location,
  //     'phone': phone,
  //     'mail': mail,
  //     'address': address,
  //     'gst': gst,
  //     'is_active': isActive,
  //   };
  // }

  // BranchModel copyWith({
  //   int? id,
  //   String? name,
  //   int? patientsCount,
  //   String? location,
  //   String? phone,
  //   String? mail,
  //   String? address,
  //   String? gst,
  //   bool? isActive,
  // }) {
  //   return BranchModel(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     patientsCount: patientsCount ?? this.patientsCount,
  //     location: location ?? this.location,
  //     phone: phone ?? this.phone,
  //     mail: mail ?? this.mail,
  //     address: address ?? this.address,
  //     gst: gst ?? this.gst,
  //     isActive: isActive ?? this.isActive,
  //   );
  // }
}
