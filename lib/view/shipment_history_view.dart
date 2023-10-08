import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movemate/model/shipment_history_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/view/calculate_view.dart';

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
                          )),
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
                const CalculateHeadingText(title: "Shipments"),
                const YMargin(10),
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

class ShipmentHistoryItemContainer extends StatelessWidget {
  final List<ShipmentHistoryModel> shipmentHistoryList;
  const ShipmentHistoryItemContainer(
      {super.key, required this.shipmentHistoryList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: shipmentHistoryList.length,
        itemBuilder: (ctx, index) {
          final ShipmentHistoryModel shipmentHistoryModel =
              shipmentHistoryList[index];
          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: AppColors.greyScale2,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              (shipmentHistoryModel.status ==
                                      ShipmentHistoryStatus.completed
                                  ? CupertinoIcons.check_mark_circled
                                  : shipmentHistoryModel.status ==
                                          ShipmentHistoryStatus.pending
                                      ? CupertinoIcons.timer
                                      : Icons.cached_outlined),
                              size: 14.sp,
                              color: shipmentHistoryModel.status.color,
                            ),
                            const XMargin(5),
                            Text(
                              shipmentHistoryModel.status.title.toLowerCase(),
                              style: AppStyle.smallTextRegular(
                                fontWeight: FontWeight.bold,
                                color: shipmentHistoryModel.status.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const YMargin(5),
                      Text(
                        "Arriving Today!",
                        style: AppStyle.mediumTextRegular(
                            fontWeight: FontWeight.bold),
                      ),
                      const YMargin(5),
                      Text(
                        "Your delivery, ${shipmentHistoryModel.id} from ${shipmentHistoryModel.location} is arriving today",
                        style: AppStyle.smallTextRegular(
                            color: AppColors.greyScale5),
                      ),
                      const YMargin(8),
                      Row(
                        children: [
                          Text(
                            "\$${shipmentHistoryModel.amount} USD",
                            style: AppStyle.normalTextRegular(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            width: 4.w,
                            height: 4.h,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: AppColors.greyScale4,
                                shape: BoxShape.circle),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(shipmentHistoryModel.date),
                            style: AppStyle.normalTextRegular(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Image.asset(
                  "asset/icon/icon_shipment_box.png",
                  height: 70.h,
                  width: 70.w,
                )
              ],
            ),
          );
        });
  }
}
