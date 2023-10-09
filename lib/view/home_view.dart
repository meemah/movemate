import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_vehicle_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/shared/widgets/app_textfield.dart';
import 'package:movemate/shared/widgets/scan_receipt_container.dart';
import 'package:movemate/view/search_view.dart';

import '../shared/widgets/heading_text.dart';
import '../shared/widgets/tracking_detail_container.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.greyScale4,
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: AppTextField(
                    suffixIcon: const ScanReceiptContainer(),
                    readOnly: true,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const SearchView())),
                    showPrefixIconBorder: false,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 18.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    radius: 60,
                    controller: searchController,
                    hintText: "Enter receipt number or item name"),
              ),
              const YMargin(20)
            ],
          ).animate().animate().moveY(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp,
                  child: const Icon(Icons.person_3_outlined),
                ),
                const XMargin(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location_fill,
                            size: 14,
                            color: Colors.white70,
                          ),
                          const XMargin(4),
                          Text(
                            "Your location",
                            style: AppStyle.smallTextRegular(
                                color: Colors.white70),
                          )
                        ],
                      ),
                      const YMargin(4),
                      Row(
                        children: [
                          Text(
                            "Wertheimer, Illinios",
                            style:
                                AppStyle.mediumTextRegular(color: Colors.white),
                          ),
                          const XMargin(2),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 12.sp,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.bell,
                    size: 20.sp,
                  ),
                )
              ],
            ),
            const YMargin(10),
          ],
        ).animate().moveY(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TrackingDetailContainer(),
            const YMargin(15),
            const HeadingText(title: "Available Vehicles"),
            SizedBox(
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: ShipmentVehicleModel.shipmentVehicle
                    .map((e) => Container(
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title,
                                      style: AppStyle.mediumTextMedium(),
                                    ),
                                    const YMargin(5),
                                    Text(
                                      e.subTitle,
                                      style: AppStyle.smallTextRegular(
                                        color: AppColors.greyScale5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.only(left: 40),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      e.icon,
                                      scale: 0.5,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                    )),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ).animate().moveX()
          ],
        ),
      ),
    );
  }
}
