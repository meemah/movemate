import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_button.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MoveMate",
                  style: AppStyle.mediumTextMedium(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)
                      .copyWith(fontStyle: FontStyle.italic),
                ),
                const XMargin(5),
                Image.asset(
                  "asset/icon/icon_movemate.png",
                  scale: 2,
                ),
              ],
            ),
            const YMargin(20),
            Image.asset(
              "asset/icon/icon_shipment_box.png",
              scale: 2.0,
            ),
            const YMargin(15),
            Text(
              "Total Estimated Amount",
              style: AppStyle.mediumTextMedium(fontSize: 18),
            ),
            const YMargin(8),
            Text(
              "\$1403 USD",
              style: AppStyle.mediumTextMedium(color: AppColors.success),
            ),
            const YMargin(8),
            Text(
              "This amount is estimated this will vary if you change your location or weight",
              textAlign: TextAlign.center,
              style: AppStyle.normalTextRegular(color: AppColors.greyScale5),
            ),
            const YMargin(35),
            AppButton(
              title: "Back to Home",
              onTap: () {},
            )
          ],
        ).animate().fadeIn(),
      ),
    );
  }
}
