import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';

class ShipmentHistoryModel {
  final ShipmentHistoryStatus status;
  final double amount;
  final DateTime date;
  final String location;
  final String id;

  ShipmentHistoryModel(
      {required this.status,
      required this.id,
      required this.amount,
      required this.date,
      required this.location});

  static List<ShipmentHistoryModel> shipmentHistory = [
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.completed,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.pending,
        id: "NEJ20089934122231",
        amount: 650,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.pending,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.completed,
        id: "NEJ20089934122231",
        amount: 100,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.pending,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.completed,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.progress,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.pending,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.completed,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistoryModel(
        status: ShipmentHistoryStatus.progress,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta")
  ];
}

enum ShipmentHistoryStatus {
  progress,
  pending,
  // loading,
  completed,
  all;
}

extension SelectedShipmentHistoryStatus on ShipmentHistoryStatus {
  String get name => describeEnum(this);
  String get title {
    switch (this) {
      case ShipmentHistoryStatus.progress:
        return "In-progress";
      case ShipmentHistoryStatus.pending:
        return "Pending";
      case ShipmentHistoryStatus.completed:
        return "Completed";
      default:
        return "All";
    }
  }

  Color get color {
    switch (this) {
      case ShipmentHistoryStatus.progress:
        return AppColors.success;
      case ShipmentHistoryStatus.pending:
        return AppColors.pending;
      case ShipmentHistoryStatus.completed:
        return AppColors.primary;
      default:
        return AppColors.primary;
    }
  }
}
