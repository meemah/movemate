import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';

import '../../model/bottom_nav_model.dart';
import '../util/theme/app_styles/app_style.dart';

class BottomNavContainer extends StatelessWidget {
  final BottomNavModel item;
  final bool isSelected;
  final Function() onTap;
  const BottomNavContainer({
    super.key,
    required this.isSelected,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0.h,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              color: isSelected ? Theme.of(context).primaryColor : null,
              height: 5.h,
            ),
            Icon(
              item.icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : AppColors.greyScale5,
              size: 20.sp,
            ),
            const YMargin(2.0),
            Text(
              item.label,
              style: AppStyle.normalTextRegular(
                fontSize: 13,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : AppColors.greyScale5,
              ),
            ),
            const YMargin(5.0),
          ],
        ),
      ),
    );
  }
}
