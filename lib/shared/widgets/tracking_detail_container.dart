import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/shared/widgets/heading_text.dart';

import '../util/theme/app_colors/app_colors.dart';
import '../util/theme/app_styles/app_style.dart';

class TrackingDetailContainer extends StatelessWidget {
  const TrackingDetailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(
          title: "Tracking",
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipment Number",
                                style: AppStyle.smallTextRegular(
                                    color: AppColors.greyScale5,
                                    fontWeight: FontWeight.w600),
                              ),
                              const YMargin(8),
                              Text(
                                "NEJ20089934122231",
                                style: AppStyle.mediumTextMedium(),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          "asset/icon/icon_shipment_truck.png",
                          height: 50.h,
                          width: 50.w,
                        )
                      ],
                    ),
                    Divider(
                      color: AppColors.greyScale2,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TrackingDetail(
                                  icon: "asset/icon/icon_sender.jpeg",
                                  title: "Sender",
                                  subTitle: "Atlanta, 5243"),
                              TrackingDetail(
                                  icon: "asset/icon/icon_receiever.jpeg",
                                  title: "Receiver",
                                  subTitle: "Chicago, 6342"),
                            ],
                          ),
                        ),
                        YMargin(150),
                        Expanded(
                          child: Column(
                            children: [
                              TrackingDetail(
                                  showIndicator: true,
                                  title: "Time",
                                  subTitle: "2 day -3 days"),
                              TrackingDetail(
                                  title: "Status",
                                  subTitle: "Waiting to collect"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: AppColors.greyScale2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.pending,
                    size: 18,
                  ),
                  Text(
                    "Add Stop",
                    style: AppStyle.smallTextRegular(
                        color: AppColors.pending, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ).animate().moveX(),
        ),
      ],
    );
  }
}

class TrackingDetail extends StatelessWidget {
  final String? icon;
  final String title;
  final String subTitle;
  final bool showIndicator;
  const TrackingDetail(
      {super.key,
      this.icon,
      required this.title,
      required this.subTitle,
      this.showIndicator = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    icon!,
                    width: 30.w,
                    height: 30.h,
                  ),
                )
              : Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyle.smallTextRegular(
                    color: AppColors.greyScale5, fontWeight: FontWeight.w600),
              ),
              const YMargin(3),
              Row(
                children: [
                  showIndicator
                      ? Container(
                          height: 4.5.h,
                          width: 4.5.h,
                          margin: EdgeInsets.only(right: 3.w),
                          decoration: const BoxDecoration(
                              color: AppColors.success, shape: BoxShape.circle),
                        )
                      : Container(),
                  Text(
                    subTitle,
                    style:
                        AppStyle.normalTextRegular(fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
