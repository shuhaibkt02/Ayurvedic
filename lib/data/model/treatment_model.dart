import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:flutter/material.dart';

@immutable
class TreatmentModel {
  final int id;
  final List<BranchModel> branches;
  final String name;
  final String duration;
  final String price;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  const TreatmentModel({
    required this.id,
    required this.branches,
    required this.name,
    required this.duration,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      id: json['id'],
      branches: (json['branches'] as List<dynamic>)
          .map((branchJson) => BranchModel.fromJson(branchJson))
          .toList(),
      name: json['name'],
      duration: json['duration'],
      price: json['price'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branches': branches.map((branch) => branch.toJson()).toList(),
      'name': name,
      'duration': duration,
      'price': price,
      'isActive': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  TreatmentModel copyWith({
    int? id,
    List<BranchModel>? branches,
    String? name,
    String? duration,
    String? price,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return TreatmentModel(
      id: id ?? this.id,
      branches: branches ?? this.branches,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
