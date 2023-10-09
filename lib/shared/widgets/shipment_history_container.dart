import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movemate/model/shipment_history_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';

class ShipmentHistoryItemContainer extends HookWidget {
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
          ).animate().fade(begin: 0.8, end: 1).slideY(begin: 1, end: 0);
        });
  }
}
