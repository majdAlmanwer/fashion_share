import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/filter_model.dart';
import 'custom_drop_down_filed.dart';

class CustomFilterBar extends StatefulWidget {
  const CustomFilterBar({super.key});

  @override
  State<CustomFilterBar> createState() => _CustomFilterBarState();
}

class _CustomFilterBarState extends State<CustomFilterBar> {
  List<FilterModel> sort = getSortList();
  RxInt id = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getPercentScreenHeight(8),
        width: getPercentScreenWidth(100),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Row(
              children: [
                Text('${'Sort'.tr} :',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black)),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: getPercentScreenWidth(40),
                  child: CustomDropDownFiled(
                    list: sort,
                    title: sort.first.name,
                    dropDownValue: id,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text('${'Filter'.tr} :',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black)),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        content: FilterWidget(),
                        title: 'Filter'.tr,
                      );
                    },
                    child: Image.asset(
                      'assets/images/filter.png',
                      height: getPercentScreenHeight(5),
                    ))
              ],
            )
          ],
        ));
  }
}

List<FilterModel> getSortList() {
  List<FilterModel> sortList = [];
  sortList.add(
    FilterModel(id: 1, name: 'Recommended'),
  );
  sortList.add(
    FilterModel(id: 2, name: 'New Arrivals'),
  );
  sortList.add(
    FilterModel(id: 3, name: 'Price: High To Low'),
  );
  sortList.add(
    FilterModel(id: 4, name: 'Price: Low To High'),
  );

  return sortList;
}
