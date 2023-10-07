import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/login_controller.dart';
import 'package:fashion_share/screens/auth/sign_up_screen.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_config.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoaderController loaderController = Get.put(LoaderController());
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
                            'Welcome'.tr,
                            style: TextStyle(
                                fontSize: 45, fontFamily: 'segoeuiBold'),
                          ),
                        ).paddingOnly(
                            right: getPercentScreenWidth(3),
                            left: getPercentScreenWidth(3),
                            top: getPercentScreenHeight(3)),
                        Container(
                          // color: Colors.amber,
                          height: getPercentScreenHeight(5),
                          child: AutoSizeText(
                            'Enter your information to continue'.tr,
                            style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontFamily: 'segoeui'),
                          ),
                        ).paddingOnly(
                            right: getPercentScreenWidth(3),
                            left: getPercentScreenWidth(3),
                            bottom: getPercentScreenHeight(3)),
                        Container(
                          // color: Colors.amber,
                          height: getPercentScreenHeight(40),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('Email'.tr).paddingOnly(
                                    right: getPercentScreenWidth(1),
                                    left: getPercentScreenWidth(1),
                                    bottom: getPercentScreenHeight(2)),
                                CustomTextFormField(
                                  hint: 'Enter your Email'.tr,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
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
                                    bottom: getPercentScreenHeight(3)),
                                AutoSizeText('Password'.tr).paddingOnly(
                                    right: getPercentScreenWidth(1),
                                    left: getPercentScreenWidth(1),
                                    bottom: getPercentScreenHeight(2)),
                                CustomTextFormField(
                                  hint: 'Enter your password'.tr,
                                  controller: passwordController,
                                  keyboardType: TextInputType.emailAddress,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: AutoSizeText(
                                          'Forgot Password?'.tr,
                                          style: TextStyle(
                                              color: sblueColor,
                                              fontSize: 15,
                                              fontFamily: 'segoeuiBold'),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: CustomButton(
                            title: 'Login'.tr,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Get.showOverlay(
                                    asyncFunction: () async =>
                                        await loginController.login(
                                            email: emailController.text,
                                            password: passwordController.text),
                                    loadingWidget: LoaderWidget(),
                                    opacityColor: blueColor.withOpacity(0.2));
                                // loginController.login(
                                //     emailController.text,
                                //     passwordController.text);
                              }
                            },
                          ),
                        ).paddingOnly(bottom: getPercentScreenHeight(3)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'Don’t Have An Account?'.tr,
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  fontFamily: 'segoeuiBold'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(SignUpScreen());
                                },
                                child: AutoSizeText(
                                  'Create Account'.tr,
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
