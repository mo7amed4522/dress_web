// ignore_for_file: body_might_complete_normally_nullable

import 'package:dress_web/controller/edit_department_screen_controller/edit_department_screen_controller.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EditDepartmrtmentScreen extends StatelessWidget {
  const EditDepartmrtmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EditDepartmentScreenControllerIMP>(
        init: EditDepartmentScreenControllerIMP(),
        builder: (controller) => controller.dataDepartmentModel == null
            ? Center(
                child: Text(
                'noDepartmenetEdit'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: haightlightAR, fontSize: 4.sp),
              ))
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: Get.width,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                          ),
                          child: Image.network(
                            controller.dataDepartmentModel!.depPhoto!,
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
                        buttonName: 'ok'.tr,
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
