import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_history_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/shipment_history_container.dart';

import '../shared/widgets/heading_text.dart';

class ShipmentHistoryView extends HookWidget {
  const ShipmentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var currentTab = useState(0);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: AppColors.greyScale4,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
                onTap: (value) => currentTab.value = value,
                isScrollable: true,
                indicatorColor: AppColors.pending,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.greyScale1,
                tabs: [
                  ShipmentHistoryStatus.all,
                  ShipmentHistoryStatus.completed,
                  ShipmentHistoryStatus.progress,
                  ShipmentHistoryStatus.pending
                ]
                    .asMap()
                    .map((index, item) => MapEntry(
                          index,
                          Tab(
                              icon: Row(
                            children: [
                              Text(item.title),
                              Container(
                                margin: EdgeInsets.only(left: 8.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: index == currentTab.value
                                        ? AppColors.pending
                                        : Colors.white10,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Text(
                                  (item != ShipmentHistoryStatus.all
                                          ? ShipmentHistoryModel.shipmentHistory
                                              .where((element) =>
                                                  element.status == item)
                                              .length
                                          : ShipmentHistoryModel
                                              .shipmentHistory.length)
                                      .toString(),
                                  style: AppStyle.smallTextRegular(
                                      color: Colors.white),
                                ),
                              )
                            ],
                          )).animate(
                              effects: index == currentTab.value
                                  ? [
                                      const ScaleEffect(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      )
                                    ]
                                  : []),
                        ))
                    .values
                    .toList()),
            title: Text(
              'Shipment History',
              style: AppStyle.mediumTextRegular(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const HeadingText(title: "Shipments"),
                Expanded(
                  child: TabBarView(
                    children: [
                      ShipmentHistoryItemContainer(
                          shipmentHistoryList:
                              ShipmentHistoryModel.shipmentHistory),
                      ShipmentHistoryItemContainer(
                        shipmentHistoryList: ShipmentHistoryModel
                            .shipmentHistory
                            .where((element) =>
                                element.status ==
                                ShipmentHistoryStatus.completed)
                            .toList(),
                      ),
                      ShipmentHistoryItemContainer(
                        shipmentHistoryList: ShipmentHistoryModel
                            .shipmentHistory
                            .where((element) =>
                                element.status ==
                                ShipmentHistoryStatus.progress)
                            .toList(),
                      ),
                      ShipmentHistoryItemContainer(
                        shipmentHistoryList: ShipmentHistoryModel
                            .shipmentHistory
                            .where((element) =>
                                element.status == ShipmentHistoryStatus.pending)
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
