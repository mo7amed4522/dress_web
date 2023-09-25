// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:dress_web/controller/login_screen_controller/login_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:dress_web/core/func/valid_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: GetBuilder<LoginScreenControllerIMP>(
          init: LoginScreenControllerIMP(),
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Form(
                  key: formState,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        Center(
                          child: Text(
                            'welcom1'.tr,
                            style: GoogleFonts.notoKufiArabic(
                              color: Colors.white,
                              fontSize: 6.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: Text(
                            'welcom2'.tr,
                            style: GoogleFonts.notoKufiArabic(
                              color: Colors.white,
                              fontSize: 4.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormFild(
                          mycontroller: controller.emailController,
                          hintText: "Enter your e-mail".tr,
                          lable: "Email".tr,
                          suffixIcon: CupertinoIcons.envelope_fill,
                          textInputType: TextInputType.emailAddress,
                          validator: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormFild(
                          mycontroller: controller.passwordController,
                          hintText: "Enter your password".tr,
                          lable: "Passowrd".tr,
                          suffixIcon: controller.iconDate,
                          isShowText: controller.isShowPassword,
                          sufficsIconTap: controller.changeShowPassword,
                          textInputType: TextInputType.visiblePassword,
                          validator: (val) {
                            return validInput(val!, 5, 100, "password");
                          },
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
                          child: ButtomLoginWidget(
                            buttonName: 'login'.tr,
                            ontap: () {
                              if (formState.currentState!.validate()) {
                                controller.onloginTap();
                              } else {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppPhotoLink.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
