import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';

import '../util/theme/app_colors/app_colors.dart';

class CountDownAmountContainer extends HookWidget {
  const CountDownAmountContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final animationCtrl = useAnimationController(
      duration: const Duration(milliseconds: 5000),
      initialValue: 1120,
      upperBound: 1420,
    );
    useEffect(() {
      animationCtrl.forward();
      return null;
    }, []);

    return Center(
      child: AnimatedBuilder(
        animation: animationCtrl,
        builder: (context, child) {
          return Text(
            "\$${animationCtrl.value.toInt()} USD",
            style: AppStyle.mediumTextMedium(
                color: AppColors.success, fontSize: 20),
          );
        },
      ),
    );
  }
}
