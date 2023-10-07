import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_config.dart';

class DropDownList extends StatefulWidget {
  DropDownList(
      {super.key,
      required this.list,
      required this.name,
      required this.selectedId});
  List list = [];
  String name;
  RxInt selectedId = 0.obs;
  // int? selectedId;
  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  RxString select = ''.obs;
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Get.bottomSheet(
          backgroundColor: Colors.white,
          isDismissible: true,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name + ' : ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'segoeuiBold',
                ),
              ).paddingAll(10),
              Container(
                height: getPercentScreenHeight(40),
                child: ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              // splashRadius: 25,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              value: false,

                              onChanged: (value) {
                                setState(() {
                                  select.value = widget.list[index].name;
                                  print(
                                      'value condition is ${widget.list[index].id}');
                                  widget.selectedId.value =
                                      widget.list[index].id;
                                  print(
                                      'value selectedId is ${widget.selectedId.value}');
                                });

                                Get.back();
                              },
                              activeColor: Colors.blue,
                            ),
                            Text(
                              widget.list[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'segoeui',
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black45,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: getPercentScreenHeight(7),
        width: getPercentScreenWidth(90),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: select.value.isEmpty
            ? Text(
                widget.name,
                style: const TextStyle(
                  color: sblueColor,
                  fontSize: 15,
                  fontFamily: 'segoeuiBold',
                ),
              )
            : Text(
                select.value,
                style: const TextStyle(
                  color: sblueColor,
                  fontSize: 15,
                  fontFamily: 'segoeuiBold',
                ),
              ),
      ),
    );
  }
}
