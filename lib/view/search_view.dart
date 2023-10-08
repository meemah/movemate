import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/model/shipment_item_model.dart';
import 'package:movemate/shared/util/theme/app_colors/app_colors.dart';
import 'package:movemate/shared/widgets/app_textfield.dart';

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
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: AppTextField(
                      suffixIcon: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.pending, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) {
                        filteredItems.value = ShipmentItemModel.shipmentItems
                            .where((element) => element.itemId
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      },
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
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: filteredItems.value.length,
              itemBuilder: (ctx, index) {
                ShipmentItemModel itemModel = filteredItems.value[index];
                return Text(itemModel.itemId);
              })),
    );
  }
}
