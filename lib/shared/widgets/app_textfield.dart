import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String hintText;
  final Color? fillColor;
  final bool readOnly;
  final Widget? suffixIcon;
  final double radius;
  final bool showPrefixIconBorder;
  final Function(String)? onChanged;
  final Function()? onTap;

  const AppTextField(
      {super.key,
      this.controller,
      this.readOnly = false,
      this.onChanged,
      this.showPrefixIconBorder = true,
      this.suffixIcon,
      this.radius = 9,
      this.prefixIcon,
      this.fillColor,
      this.onTap,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyle.normalTextRegular(),
      controller: controller,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
          isCollapsed: true,
          fillColor: fillColor ?? AppColors.greyScale2,
          filled: true,
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25.h,
            minHeight: 25.h,
            minWidth: 25.w,
          ),
          suffixIcon: suffixIcon != null
              ? Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: suffixIcon,
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    border: showPrefixIconBorder
                        ? Border(
                            right: BorderSide(width: 1.w, color: Colors.grey),
                          )
                        : null,
                  ),
                  child: prefixIcon,
                )
              : null,
          hintText: hintText,
          enabledBorder: outlineInputBorder.copyWith(
              borderRadius: BorderRadius.circular(radius)),
          hintStyle: AppStyle.normalTextRegular(color: AppColors.greyScale5),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
          border: outlineInputBorder.copyWith(
              borderRadius: BorderRadius.circular(radius)),
          focusedBorder: outlineInputBorder.copyWith(
              borderRadius: BorderRadius.circular(radius))),
    );
  }
}

final outlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(9),
);
