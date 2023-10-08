import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? buttonColor;
  final double height;
  final double? width;

  const AppButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height = 45,
      this.width,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: buttonColor ?? AppColors.pending,
      minWidth: width ?? MediaQuery.of(context).size.width,
      height: height.h,
      onPressed: onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.r))),
      child: Text(
        title,
        style: AppStyle.normalTextRegular(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
