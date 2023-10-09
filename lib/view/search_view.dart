import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_item_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/widgets/app_textfield.dart';
import 'package:movemate/shared/widgets/scan_receipt_container.dart';
import 'package:movemate/shared/widgets/shipment_item_container.dart';

import '../shared/widgets/app_spacing.dart';

class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController();
    var filteredItems = useState(ShipmentItemModel.shipmentItems);
    return Scaffold(
      backgroundColor: AppColors.greyScale4,
      appBar: AppBar(
        leading: Container(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    const XMargin(5),
                    Expanded(
                      child: AppTextField(
                          suffixIcon: const ScanReceiptContainer(),
                          onChanged: (value) {
                            filteredItems.value = ShipmentItemModel
                                .shipmentItems
                                .where((element) =>
                                    element.itemId
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    element.itemName
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                .toList();
                          },
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
                  ],
                ),
              ),
              const YMargin(20)
            ],
          ).animate().fadeIn(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          margin: const EdgeInsets.all(20),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                    color: AppColors.greyScale2,
                  ),
              itemCount: filteredItems.value.length,
              itemBuilder: (ctx, index) {
                ShipmentItemModel itemModel = filteredItems.value[index];
                return SearchItemContainer(itemModel: itemModel)
                    .animate(effects: [const MoveEffect()]);
              })),
    );
  }
}
