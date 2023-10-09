import 'package:flutter/material.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';

import 'app_spacing.dart';

class HeadingText extends StatelessWidget {
  final String title;
  final String? subTitle;
  const HeadingText({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.mediumTextMedium(),
        ),
        const YMargin(2),
        subTitle != null
            ? Text(
                subTitle!,
                style: AppStyle.normalTextRegular(color: AppColors.greyScale5),
              )
            : Container(),
        const YMargin(10)
      ],
    );
  }
}
