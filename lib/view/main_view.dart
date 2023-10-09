import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movemate/model/bottom_nav_model.dart';
import 'package:movemate/shared/widgets/bottom_nav_container.dart';
import 'package:movemate/view/calculate_view.dart';
import 'package:movemate/view/home_view.dart';
import 'package:movemate/view/shipment_history_view.dart';

class MainView extends HookWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = useState(0);
    return Scaffold(
      bottomNavigationBar: Row(
        children: BottomNavModel.bottomNavList
            .asMap()
            .map((index, item) => MapEntry(
                index,
                Expanded(
                  child: BottomNavContainer(
                      onTap: () => selectedIndex.value = index,
                      item: item,
                      isSelected: selectedIndex.value == index),
                )))
            .values
            .toList(),
      ),
      body: [
        const HomeView(),
        const CalculateView().animate().fadeIn(),
        const ShipmentHistoryView(),
      ][selectedIndex.value],
    );
  }
}
