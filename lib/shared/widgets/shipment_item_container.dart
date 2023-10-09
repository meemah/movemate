import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_item_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';

import '../util/theme/app_styles/app_style.dart';

class SearchItemContainer extends StatelessWidget {
  const SearchItemContainer({
    super.key,
    required this.itemModel,
  });

  final ShipmentItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: Image.asset(
            "asset/icon/icon_shipment_box.png",
            height: 25.h,
            width: 25.w,
          ),
        ),
        const XMargin(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemModel.itemName,
              style: AppStyle.normalTextRegular(fontWeight: FontWeight.bold),
            ),
            const YMargin(2),
            Text(
              "${itemModel.itemId} • ${itemModel.fromLocation} → ${itemModel.toLocation}",
              style: AppStyle.smallTextRegular(color: AppColors.greyScale5),
            ),
          ],
        ),
      ],
    );
  }
}
