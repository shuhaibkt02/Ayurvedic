import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/data/model/patient_detail_model.dart';
import 'package:flutter/material.dart';

@immutable
class PatientModel {
  final int id;
  final List<PatientDetailModel> patientDetailList;
  final List<BranchModel> branch;
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final String price;
  final int totalAmount;
  final int discountAmount;
  final int advanceAmount;
  final String dateAndTime;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  const PatientModel({
    required this.id,
    required this.patientDetailList,
    required this.branch,
    required this.user,
    required this.payment,
    required this.name,
    required this.phone,
    required this.address,
    required this.price,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.dateAndTime,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      patientDetailList: (json['patientdetails_set'] as List<dynamic>)
          .map((detailJson) => PatientDetailModel.fromJson(detailJson))
          .toList(),
      branch: (json['branch'] as List<dynamic>)
          .map((branchJson) => BranchModel.fromJson(branchJson))
          .toList(),
      user: json['user'],
      payment: json['payment'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      price: json['price'] ?? '',
      totalAmount: json['total_amount'],
      discountAmount: json['discount_amount'],
      advanceAmount: json['advance_amount'],
      dateAndTime: json['date_nd_time']?? '',
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientdetails_set':
          patientDetailList.map((detail) => detail.toJson()).toList(),
      'branch': branch.map((branch) => branch.toJson()).toList(),
      'user': user,
      'payment': payment,
      'name': name,
      'phone': phone,
      'address': address,
      'price': price,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'advance_amount': advanceAmount,
      'date_nd_time': dateAndTime,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  PatientModel copyWith({
    int? id,
    List<PatientDetailModel>? patientDetailList,
    List<BranchModel>? branch,
    String? user,
    String? payment,
    String? name,
    String? phone,
    String? address,
    String? price,
    int? totalAmount,
    int? discountAmount,
    int? advanceAmount,
    String? dateAndTime,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return PatientModel(
      id: id ?? this.id,
      patientDetailList: patientDetailList ?? this.patientDetailList,
      branch: branch ?? this.branch,
      user: user ?? this.user,
      payment: payment ?? this.payment,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      price: price ?? this.price,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      advanceAmount: advanceAmount ?? this.advanceAmount,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
