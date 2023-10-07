import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/login_controller.dart';
import 'package:fashion_share/controller/user_controller.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/custom_button.dart';
import 'package:fashion_share/widget/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controller/image_picker_controller.dart';
import '../../../../widget/loading_widget.dart';
import '../../../../widget/titel_row.dart';
import '../../../add_product/widget/image_select.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  UserController userController = Get.put(UserController());
  LoginController loginController = Get.put(LoginController());
  LoaderController loaderController = Get.put(LoaderController());
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  TextEditingController current = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirm = TextEditingController();
  GetStorage box = GetStorage();

  XFile? image;
  ImagePicker picker = ImagePicker();
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController email =
        TextEditingController(text: userController.userInfo.data!.email);
    TextEditingController phone =
        TextEditingController(text: userController.userInfo.data!.phone);
    return Container(
      height: getPercentScreenHeight(100),
      width: getPercentScreenWidth(100),
      child: Column(
        children: [
          TitleRow(
            title: 'Edit Profile'.tr,
            widget: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  Get.back();
                }),
          ),
          imagePickerController.images.isEmpty
              ? CircleAvatar(
                  radius: getPercentScreenWidth(18),
                  backgroundColor: Colors.blue[100],
                  backgroundImage: const AssetImage(
                    'assets/images/fi_user.png',
                  )).paddingOnly(
                  top: getPercentScreenHeight(2),
                )
              : GetBuilder<ImagePickerController>(
                  builder: (controller) => CircleAvatar(
                    radius: getPercentScreenWidth(18),
                    backgroundColor: Colors.blue[100],
                    backgroundImage: FileImage(
                      File(controller.images.first.path),
                    ),
                  ).paddingOnly(top: getPercentScreenHeight(2)),
                ),
          Container(
            height: getPercentScreenHeight(12),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () async {
                  Get.bottomSheet(
                      backgroundColor: Colors.white,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24)),
                      ),
                      ImageSelectDialog());
                },
                child: SizedBox(
                    height: getPercentScreenHeight(10),
                    width: getPercentScreenWidth(10),
                    child: Image.asset('assets/images/icon-button.png')),
              ),
              SizedBox(
                width: getPercentScreenWidth(2),
              ),
              AutoSizeText(
                'Change Image'.tr,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            // color: Colors.amber,
            height: getPercentScreenHeight(55),
            width: getPercentScreenWidth(90),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('Email'.tr).paddingOnly(
                        right: getPercentScreenWidth(1),
                        left: getPercentScreenWidth(1),
                        bottom: getPercentScreenHeight(1)),
                    CustomTextFormField(
                      controller: email,
                    ),
                    // AutoSizeText('Password').paddingOnly(
                    //   right: getPercentScreenWidth(1),
                    //   left: getPercentScreenWidth(1),
                    //   bottom: getPercentScreenHeight(1),
                    //   top: getPercentScreenHeight(1),
                    // ),
                    // CustomTextFormField(hint: 'Password'),
                    AutoSizeText('Phone Number'.tr).paddingOnly(
                      right: getPercentScreenWidth(1),
                      left: getPercentScreenWidth(1),
                      bottom: getPercentScreenHeight(1),
                      top: getPercentScreenHeight(1),
                    ),
                    CustomTextFormField(
                      controller: phone,
                    ),
                    Visibility(
                      visible: visible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText('Current Password'.tr).paddingOnly(
                            right: getPercentScreenWidth(1),
                            left: getPercentScreenWidth(1),
                            bottom: getPercentScreenHeight(1),
                            top: getPercentScreenHeight(1),
                          ),
                          CustomTextFormField(
                            hint: 'Current Password',
                            controller: current,
                          ),
                          AutoSizeText('New Password'.tr).paddingOnly(
                            right: getPercentScreenWidth(1),
                            left: getPercentScreenWidth(1),
                            bottom: getPercentScreenHeight(1),
                            top: getPercentScreenHeight(1),
                          ),
                          CustomTextFormField(
                            hint: 'New Password'.tr,
                            controller: newPass,
                          ),
                          AutoSizeText('Confirm Password'.tr).paddingOnly(
                            right: getPercentScreenWidth(1),
                            left: getPercentScreenWidth(1),
                            bottom: getPercentScreenHeight(1),
                            top: getPercentScreenHeight(1),
                          ),
                          CustomTextFormField(
                            hint: 'Confirm Password'.tr,
                            controller: confirm,
                          ),
                        ],
                      ),
                    ),
                    Center(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  visible == false
                                      ? setState(() {
                                          visible = !visible;
                                        })
                                      : userController
                                          .resetPassword(current.text,
                                              newPass.text, confirm.text)
                                          .then((value) =>
                                              loginController.login(
                                                  email: userController
                                                      .userInfo.data!.email!,
                                                  password: confirm.text));
                                },
                                child: Text(
                                    visible == false
                                        ? 'Change Password'.tr
                                        : 'Confirm.tr',
                                    style: const TextStyle(
                                        color: sblueColor,
                                        fontSize: 18,
                                        fontFamily: 'AGCRegular',
                                        fontWeight: FontWeight.bold))))),
                    Center(
                        child: CustomButton(
                      title: 'Updata Profile'.tr,
                      onTap: () async {
                        Get.showOverlay(
                            asyncFunction: () => userController.updateUserInfo(
                                email.text, email.text),
                            loadingWidget: LoaderWidget(),
                            opacityColor: blueColor.withOpacity(0.2));

                        // userController.logOut();
                      },
                    )),
                    Center(
                        child: CustomButton(
                      title: 'Logout'.tr,
                      onTap: () async {
                        Get.showOverlay(
                            asyncFunction: () => userController.logOut(),
                            loadingWidget: LoaderWidget(),
                            opacityColor: blueColor.withOpacity(0.2));

                        // userController.logOut();
                        box.remove('token');
                        box.write('loggedIn', false);
                      },
                    )),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
