import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
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
                  child: SizedBox(
                    height: 100.0.h,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => selectedIndex.value = index,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            color: selectedIndex.value == index
                                ? Theme.of(context).primaryColor
                                : null,
                            height: 5.h,
                          ),
                          Icon(
                            item.icon,
                            color: selectedIndex.value == index
                                ? Theme.of(context).primaryColor
                                : AppColors.greyScale5,
                            size: 20.sp,
                          ),
                          const YMargin(2.0),
                          Text(
                            item.label,
                            style: AppStyle.normalTextRegular(
                              fontSize: 13,
                              color: selectedIndex.value == index
                                  ? Theme.of(context).primaryColor
                                  : AppColors.greyScale5,
                            ),
                          ),
                          const YMargin(5.0),
                        ],
                      ),
                    ),
                  ),
                )))
            .values
            .toList(),
      ),
      body: [
        const HomeView(),
        const CalculateView(),
        const ShipmentHistoryView()
      ][selectedIndex.value],
    );
  }
}

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
    )
  ];
}
