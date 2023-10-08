import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_cateogry_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/util/theme/app_styles/app_style.dart';
import 'package:movemate/shared/widgets/app_button.dart';
import 'package:movemate/shared/widgets/app_spacing.dart';
import 'package:movemate/shared/widgets/app_textfield.dart';

class CalculateView extends HookWidget {
  const CalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    var seletedCategory = useState(0);
    return Scaffold(
      backgroundColor: AppColors.greyScale4,
      appBar: AppBar(
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
              Text(
                "Destination",
                style: AppStyle.mediumTextRegular(fontWeight: FontWeight.w600),
              ),
              const YMargin(8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: Colors.black12)
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    AppTextField(
                        prefixIcon: const Icon(
                          Icons.scale,
                          color: Colors.grey,
                        ),
                        controller: TextEditingController(),
                        hintText: "Sender Location"),
                    const YMargin(10),
                    AppTextField(
                        prefixIcon: const Icon(
                          Icons.scale,
                          color: Colors.grey,
                        ),
                        controller: TextEditingController(),
                        hintText: "Receiver Location"),
                    const YMargin(10),
                    AppTextField(
                        prefixIcon: const Icon(
                          Icons.scale,
                          color: Colors.grey,
                        ),
                        controller: TextEditingController(),
                        hintText: "Approx. weight"),
                    const YMargin(10)
                  ],
                ),
              ),
              const YMargin(30),
              const CalculateHeadingText(
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
                    prefixIcon: const Icon(
                      Icons.scale,
                      color: Colors.grey,
                    ),
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.greyScale3,
                    ),
                    readOnly: true,
                    fillColor: Colors.white,
                    controller: TextEditingController(),
                    hintText: "Item"),
              ),
              const YMargin(30),
              const CalculateHeadingText(
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
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(7.r)),
                            child: Text(
                              item.categoryName,
                              style: AppStyle.normalTextRegular(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
              const YMargin(50),
              AppButton(
                title: "Calculate",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalculateHeadingText extends StatelessWidget {
  final String title;
  final String? subTitle;
  const CalculateHeadingText({super.key, required this.title, this.subTitle});

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
