// ignore_for_file: prefer_final_fields

import 'package:dress_web/core/constant/curd.dart';
import 'package:dress_web/core/constant/link_api.dart';
import 'package:dress_web/core/constant/loader.dart';
import 'package:dress_web/core/routes/app_router.dart';
import 'package:dress_web/core/server/serves.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginScreenController extends GetxController {
  void onloginTap();
}

class LoginScreenControllerIMP extends LoginScreenController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isShowPassword = true;
  IconData iconDate = CupertinoIcons.eye_slash_fill;
  Crud _crud = Crud();
  MyServices myServices = Get.find();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  changeShowPassword() {
    if (isShowPassword == true) {
      isShowPassword = false;
      iconDate = CupertinoIcons.eye_solid;
    } else {
      isShowPassword = true;
      iconDate = CupertinoIcons.eye_slash_fill;
    }
    update();
  }

  @override
  void onloginTap() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.loginURL, {'email': emailController.text, 'password': passwordController.text});
      if (response['status'] == 'success') {
        await myServices.sharedPreferences.setBool('isLogin', true);
        Get.back();
        Get.toNamed(AppRouter.homeScreen);
      } else {
        Get.back();
        Get.snackbar('ERROR !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
