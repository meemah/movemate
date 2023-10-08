import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_vehicle_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/shared/widgets/app_textfield.dart';
import 'package:movemate/view/calculate_view.dart';
import 'package:movemate/view/search_view.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.greyScale4,
      appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: AppTextField(
                        readOnly: true,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const SearchView())),
                        showPrefixIconBorder: false,
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                        radius: 60,
                        controller: searchController,
                        hintText: "Enter receipt number"),
                  ),
                  const YMargin(20)
                ],
              )),
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15.sp,
                    child: const Icon(Icons.person),
                  ),
                  const XMargin(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_off_rounded,
                              size: 14,
                              color: Colors.white,
                            ),
                            Text(
                              "Your location",
                              style: AppStyle.smallTextRegular(
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const YMargin(4),
                        Text(
                          "Wertheimer, Illinios",
                          style:
                              AppStyle.normalTextRegular(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.bell_circle_fill,
                    size: 40.sp,
                    color: Colors.white70,
                  )
                ],
              ),
              const YMargin(10),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CalculateHeadingText(
              title: "Tracking",
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)),
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
                            const Icon(Icons.car_rental)
                          ],
                        ),
                        const Divider(),
                        const Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  TrackingDetail(
                                      title: "Sender",
                                      subTitle: "Atlanta, 5243"),
                                  TrackingDetail(
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
                  const Divider(),
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
                            color: AppColors.pending,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            const YMargin(15),
            const CalculateHeadingText(title: "Vehicle"),
            SizedBox(
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: ShipmentVehicleModel.shipmentVehicle
                    .map((e) => Container(
                          width: MediaQuery.of(context).size.width /
                              ShipmentVehicleModel.shipmentVehicle.length,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Align(
                                alignment: Alignment.bottomRight,
                                child: e.icon,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrackingDetail extends StatelessWidget {
  final Widget? icon;
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
          icon ?? Container(),
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
