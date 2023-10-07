import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/app_config.dart';

class CustomDropDownFiled extends StatefulWidget {
  CustomDropDownFiled(
      {super.key,
      this.title,
      this.dropDownValue,
      required this.list,
      this.onTap});
  String? title;
  RxInt? dropDownValue = 0.obs;
  List list = [];
  final Function()? onTap;

  @override
  State<CustomDropDownFiled> createState() => _CustomDropDownFiledState();
}

class _CustomDropDownFiledState extends State<CustomDropDownFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      // height: getPercentScreenHeight(25),
      // width: getPercentScreenWidth(80),
      // padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),

      child: DropdownButtonFormField<dynamic>(
        // itemHeight: getPercentScreenHeight(8),
        onTap: widget.onTap,

        alignment: Alignment.center,
        isExpanded: true,
        iconDisabledColor: Colors.black45,
        iconEnabledColor: Colors.black45,
        icon: Icon(Icons.keyboard_arrow_down_sharp),

        hint: AutoSizeText(
          widget.title!.tr,
          maxFontSize: 14,
          minFontSize: 12,
          maxLines: 1,
          style: const TextStyle(
              color: sblueColor,
              // fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            gapPadding: 8.0,
            borderSide: BorderSide(color: blueColor),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          filled: false,

          // hintStyle: TextStyle(
          //   color: sblueColor,
          // ),
          // hintText: widget.title!.tr,
        ),
        // value: dropDownmodel,
        onChanged: (val) {
          setState(() {
            widget.dropDownValue!.value = val;
            print('dropdown value ======= ${val}');
          });
        },
        dropdownColor: Colors.white,
        menuMaxHeight: getPercentScreenWidth(70),

        items: widget.list.map<DropdownMenuItem<dynamic>>((value) {
          return DropdownMenuItem<dynamic>(
            // alignment: Alignment.bottomCenter,
            value: value.id,
            child: Text(
              value.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: sblueColor, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          );
        }).toList(),
      ),
    );
  }
}
