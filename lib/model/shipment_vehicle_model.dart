import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentVehicleModel {
  final Widget icon;
  final String title;
  final String subTitle;

  ShipmentVehicleModel(
      {required this.icon, required this.title, required this.subTitle});
  static List<ShipmentVehicleModel> shipmentVehicle = [
    ShipmentVehicleModel(
        icon: Icon(
          Icons.cabin,
          size: 100.sp,
        ),
        title: "Ocean freight",
        subTitle: "International"),
    ShipmentVehicleModel(
        icon: Icon(
          Icons.fire_truck,
          size: 100.sp,
        ),
        title: "Cargo freight",
        subTitle: "Reliable"),
    ShipmentVehicleModel(
        icon: Icon(
          Icons.airplanemode_active_rounded,
          size: 100.sp,
        ),
        title: "Air freight",
        subTitle: "International"),
  ];
}
