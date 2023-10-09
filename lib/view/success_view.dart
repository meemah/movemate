import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_button.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/shared/widgets/countdown_amount_container.dart';

class SuccessView extends HookWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    var isTapped = useState(false);

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
            const CountDownAmountContainer(),
            const YMargin(8),
            Text(
              "This amount is estimated this will vary if you change your location or weight",
              textAlign: TextAlign.center,
              style: AppStyle.normalTextRegular(color: AppColors.greyScale5),
            ),
            const YMargin(35),
            AppButton(
              title: "Back to Home",
              onTap: () {
                isTapped.value = !isTapped.value;
                Navigator.pop(context);
              },
            )
                .animate(
                  target: isTapped.value ? 1 : 0.9,
                )
                .scaleXY(curve: Curves.bounceInOut)
          ],
        ),
      ),
    );
  }
}
