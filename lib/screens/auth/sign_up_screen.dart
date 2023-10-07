import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/routes/routes.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../utils/app_config.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_filed.dart';
import '../../widget/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LoginController loginController = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: getPercentScreenHeight(100),
          width: getPercentScreenWidth(100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // color: Colors.amber,
                  height: getPercentScreenHeight(90),
                  width: getPercentScreenWidth(90),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: getPercentScreenHeight(10),
                          width: getPercentScreenWidth(60),
                          child: Image.asset('assets/images/Logo.png'),
                        ),
                        Container(
                          // color: Colors.amber,
                          height: getPercentScreenHeight(8),
                          child: AutoSizeText(
                            'Create Account'.tr,
                            style: const TextStyle(
                                fontSize: 45, fontFamily: 'segoeuiBold'),
                          ),
                        ).paddingOnly(
                            right: getPercentScreenWidth(3),
                            left: getPercentScreenWidth(3),
                            top: getPercentScreenHeight(2)),
                        Container(
                          // color: Colors.amber,
                          height: getPercentScreenHeight(5),
                          child: AutoSizeText(
                            'Create your account to get started'.tr,
                            style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontFamily: 'segoeui'),
                          ),
                        ).paddingOnly(
                            right: getPercentScreenWidth(3),
                            left: getPercentScreenWidth(3),
                            bottom: getPercentScreenHeight(1)),
                        Container(
                          // color: Colors.amber,
                          height: getPercentScreenHeight(45),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('Email'.tr).paddingOnly(
                                    right: getPercentScreenWidth(1),
                                    left: getPercentScreenWidth(1),
                                    bottom: getPercentScreenHeight(1)),
                                CustomTextFormField(
                                  hint: 'Enter your Email'.tr,
                                  controller: emailController,
                                  onChange: (value) {
                                    if (value.isEmpty) {
                                      print('123456null');
                                    } else {
                                      value = emailController.text;
                                      print(value);
                                    }
                                  },
                                  validator: (val) {
                                    // val = emailController.text;
                                    if (val!.isEmpty) {
                                      return 'Please enter a valid email address'
                                          .tr
                                          .tr;
                                    }
                                    if (!val.contains('@')) {
                                      return 'Email is invalid, must contain @'
                                          .tr
                                          .tr;
                                    }
                                    if (!val.contains('.')) {
                                      return 'Email is invalid, must contain (.)'
                                          .tr
                                          .tr;
                                    }
                                    return null;
                                  },
                                ).paddingOnly(
                                    bottom: getPercentScreenHeight(2)),
                                AutoSizeText('Password'.tr).paddingOnly(
                                    right: getPercentScreenWidth(1),
                                    left: getPercentScreenWidth(1),
                                    bottom: getPercentScreenHeight(1)),
                                CustomTextFormField(
                                  hint: 'Enter your password'.tr,
                                  controller: passwordController,
                                  onChange: (value) {
                                    if (value.isEmpty) {
                                      print('123456null');
                                    } else {
                                      value = passwordController.text;
                                      print(value);
                                    }
                                  },
                                  validator: (val) {
                                    // val = emailController.text;
                                    if (val!.isEmpty) {
                                      return 'Please enter a valid Password'.tr;
                                    }

                                    return null;
                                  },
                                  obscureText: _showPassword,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    child: Icon(
                                      _showPassword == true
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: sblueColor,
                                    ),
                                  ),
                                ),
                                AutoSizeText('Phone Number'.tr).paddingOnly(
                                  right: getPercentScreenWidth(1),
                                  left: getPercentScreenWidth(1),
                                  bottom: getPercentScreenHeight(1),
                                  top: getPercentScreenHeight(2),
                                ),
                                CustomTextFormField(
                                  hint: 'Enter your Phone Number'.tr,
                                  controller: phoneController,
                                  validator: (val) {
                                    // val = passwordController.text;
                                    if (val!.isEmpty) {
                                      return 'Enter your Phone Number'.tr;
                                    } else if (val.length < 10) {
                                      return 'phoneNumber must be at least of length 10'
                                          .tr;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                            child: CustomButton(
                          title: 'Create Account'.tr,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.showOverlay(
                                asyncFunction: () => loginController
                                    .registar(
                                        emailController.text,
                                        passwordController.text,
                                        phoneController.text)
                                    .then((value) async =>
                                        await loginController.login(
                                            email: emailController.text,
                                            password: passwordController.text)),
                                loadingWidget: LoaderWidget(),
                                opacityColor: blueColor.withOpacity(0.2),
                              );
                              // loginController
                              //     .registar(
                              //         emailController.text,
                              //         passwordController.text,
                              //         phoneController.text)
                              //     .then((value) async =>
                              //         await loginController.login(
                              //             emailController.text,
                              //             passwordController.text));
                            } else {
                              print('555555555555');
                            }
                          },
                        )).paddingOnly(bottom: getPercentScreenHeight(1)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'Already Have An Account?'.tr,
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  fontFamily: 'segoeuiBold'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.loginscreen);
                                },
                                child: AutoSizeText(
                                  'Login'.tr,
                                  style: const TextStyle(
                                      color: sblueColor,
                                      fontSize: 15,
                                      fontFamily: 'segoeuiBold'),
                                )),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
