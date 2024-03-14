import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/data/model/patient_detail_model.dart';
import 'package:flutter/material.dart';

@immutable
class PatientModel {
  final int id;
  final List<PatientDetailModel> patientDetailList;
  final BranchModel? branch;
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final dynamic price;
  final int totalAmount;
  final int discountAmount;
  final int advanceAmount;
  final int balanceAmount;
  final dynamic dateAndTime;
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
    required this.balanceAmount,
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
      branch: json['branch'] != null ? BranchModel.fromJson(json['branch']) : null,
      user: json['user'] ?? '',
      payment: json['payment'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      price: json['price'].toString() ,
      totalAmount: json['total_amount'] ?? 0,
      discountAmount: json['discount_amount'] ?? 0,
      advanceAmount: json['advance_amount'] ?? 0,
      balanceAmount: json['balance_amount'] ?? 0,
      dateAndTime: json['date_nd_time'].toString(),
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
  
Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientdetails_set':
          patientDetailList.map((detail) => detail.toJson()).toList(),
      'branch': branch,
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
    BranchModel? branch,
    String? user,
    String? payment,
    String? name,
    String? phone,
    String? address,
    dynamic price,
    int? totalAmount,
    int? discountAmount,
    int? advanceAmount,
    int? balanceAmount,
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
      balanceAmount: balanceAmount ?? this.balanceAmount,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

