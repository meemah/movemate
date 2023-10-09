import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_cateogry_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_button.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/shared/widgets/app_textfield.dart';
import 'package:movemate/view/success_view.dart';

import '../shared/widgets/heading_text.dart';

class CalculateView extends HookWidget {
  const CalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    var seletedCategory = useState(-1);
    return Scaffold(
      backgroundColor: AppColors.greyScale4,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Calculate",
            style: AppStyle.mediumTextRegular(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(title: "Destination"),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: Colors.black12)
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: const Column(
                  children: [
                    AppTextField(
                        prefixIcon: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.archive_outlined,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        hintText: "Sender Location"),
                    YMargin(10),
                    AppTextField(
                        prefixIcon: Icon(
                          Icons.archive_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        hintText: "Receiver Location"),
                    YMargin(10),
                    AppTextField(
                        prefixIcon: Icon(
                          Icons.scale,
                          size: 18,
                          color: Colors.grey,
                        ),
                        hintText: "Approx. weight"),
                    YMargin(10)
                  ],
                ),
              ).animate().moveY(),
              const YMargin(30),
              const HeadingText(
                title: "Destination",
                subTitle: "What are you sending?",
              ),
              PopupMenuButton<String>(
                initialValue: "Box",
                onSelected: (String item) {},
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "Box",
                    child: Text('Box'),
                  ),
                ],
                icon: AppTextField(
                    prefixIcon: Image.asset(
                      "asset/icon/icon_shipment_box.png",
                    ),
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.greyScale3,
                    ),
                    readOnly: true,
                    fillColor: Colors.white,
                    controller: TextEditingController(),
                    hintText: "Item"),
              ).animate().fadeIn(),
              const YMargin(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(
                    title: "Categories",
                    subTitle: "What are you sending?",
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: ShipmentCategoryModel.categories
                        .asMap()
                        .map(
                          (index, item) => MapEntry(
                              index,
                              GestureDetector(
                                onTap: () => seletedCategory.value = index,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                      color: index == seletedCategory.value
                                          ? AppColors.blackText1
                                          : null,
                                      border: index == seletedCategory.value
                                          ? null
                                          : Border.all(
                                              color: AppColors.blackText1),
                                      borderRadius: BorderRadius.circular(7.r)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      index == seletedCategory.value
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 3),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 14.sp,
                                              ),
                                            )
                                          : Container(),
                                      Text(item.categoryName,
                                          style: AppStyle.normalTextRegular(
                                              fontSize: 13,
                                              color:
                                                  index == seletedCategory.value
                                                      ? Colors.white
                                                      : AppColors.blackText1))
                                    ],
                                  ),
                                ),
                              )),
                        )
                        .values
                        .toList(),
                  ),
                  const YMargin(50),
                ],
              ).animate().moveX(curve: Curves.easeIn),
              AppButton(
                title: "Calculate",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const SuccessView();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
