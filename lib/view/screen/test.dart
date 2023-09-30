// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors

import 'package:dress_web/controller/test_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:dress_web/view/widget/dashboard_screen/cirecle_avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TestHomePage extends StatelessWidget {
  const TestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestScreenControllerIMP>(
      init: TestScreenControllerIMP(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  'addnewDep'.tr,
                  style: TextStyle(
                    fontSize: 7.sp,
                    fontFamily: haightlightAR,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 2.h),
              GetBuilder<TestScreenControllerIMP>(
                init: TestScreenControllerIMP(),
                builder: (con) => CircleAvatarWidget(onCameraTap: con.onCameraTap, backgroundImage: Image.asset(AppPhotoLink.noUserProfile)),
              ),
              SizedBox(height: 2.h),
              CustomTextFormFild(
                mycontroller: controller.nameDepartmentController,
                hintText: "enterDepartment".tr,
                lable: "department".tr,
                suffixIcon: CupertinoIcons.globe,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'departmentnotempity'.tr;
                  }
                },
              ),
              SizedBox(height: 6.h),
              ButtomLoginWidget(
                buttonName: 'ok'.tr,
                ontap: controller.onAddNewDepartment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
