// ignore_for_file: body_might_complete_normally_nullable

import 'package:dress_web/controller/make_new_department_screen_controller/make_new_department_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MakeNewDepartmentScreen extends StatelessWidget {
  const MakeNewDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MakeNewDepartmentScreenControllerIMP>(
        init: MakeNewDepartmentScreenControllerIMP(),
        builder: (controller) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
            child: Column(
              children: [
                InkWell(
                  onTap: controller.onCameraTap,
                  child: Container(
                    width: Get.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                    ),
                    child: controller.isPhoto == false
                        ? Image.asset(
                            AppPhotoLink.noUserProfile,
                            height: 20.h,
                            width: Get.width,
                            fit: BoxFit.fill,
                          )
                        : Image.memory(
                            webImage,
                            height: 20.h,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                SizedBox(height: 3.h),
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
                  buttonName: 'addnewDepartment'.tr,
                  ontap: controller.onAddNewDepartment,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
