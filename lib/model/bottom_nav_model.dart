import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavModel {
  final String label;
  final IconData icon;

  BottomNavModel({required this.label, required this.icon});

  static List<BottomNavModel> bottomNavList = [
    BottomNavModel(
      icon: CupertinoIcons.home,
      label: "Home",
    ),
    BottomNavModel(
      icon: Icons.calculate,
      label: "Calculate",
    ),
    BottomNavModel(
      icon: Icons.history,
      label: "Shipment",
    ),
    BottomNavModel(
      icon: Icons.person_2_outlined,
      label: "Profile",
    )
  ];
}
