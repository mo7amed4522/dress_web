// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'dart:ui';

import 'package:dress_web/controller/dashboard_screen_controller/dashboard_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AlterWidgetDialog {
  Future<void> showAlterDialogAdd() {
    GlobalKey<FormState> formState = GlobalKey();
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Form(
            key: formState,
            child: GetBuilder<DsahboardScreebControllerIMP>(
              init: DsahboardScreebControllerIMP(),
              builder: (con) => AlertDialog(
                title: Text(
                  'Add new Department',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: haightlightEng,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Builder(builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return SizedBox(
                    height: height - 40.h,
                    width: width - 30.w,
                    child: Column(
                      children: [
                        Text(
                          'Add new department to your collection for the first time !!',
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: haightlightEng,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        GetBuilder<DsahboardScreebControllerIMP>(
                          init: DsahboardScreebControllerIMP(),
                          builder: (controller) => InkWell(
                            onTap: controller.onCameraTap,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 2.sp),
                              height: 30.h,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                              child: controller.isShow == false
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      child: Image.asset(
                                        AppPhotoLink.noUserProfile,
                                        height: 30.h,
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      child: Image.memory(
                                        controller.webImage,
                                        height: 30.h,
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        CustomTextFormFild(
                          mycontroller: con.nameDepartmentController,
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
                      ],
                    ),
                  );
                }),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('No')),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        con.onAddNewDepartment();
                        Get.back();
                        con.getDepartment();
                      }
                    },
                    child: Text(
                      'Add New !!',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> showAlterDialogEdit({
    required String imgeURL,
    required TextEditingController nameController,
  }) {
    GlobalKey<FormState> formState = GlobalKey();
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Form(
            key: formState,
            child: GetBuilder<DsahboardScreebControllerIMP>(
              init: DsahboardScreebControllerIMP(),
              builder: (con) => AlertDialog(
                title: Text(
                  'Edit Department',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: haightlightEng,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Builder(
                  builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return SizedBox(
                      height: height - 40.h,
                      width: width - 30.w,
                      child: Column(
                        children: [
                          Text(
                            'Please edit your data of your department !!',
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontFamily: haightlightEng,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 2.h),
                          GetBuilder<DsahboardScreebControllerIMP>(
                            init: DsahboardScreebControllerIMP(),
                            builder: (controller) => InkWell(
                              onTap: controller.pickedImageEdit,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 2.sp),
                                height: 30.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                                child: controller.isShowEdit == false
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20.sp),
                                        child: Image.network(
                                          imgeURL,
                                          height: 30.h,
                                          width: Get.width,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(20.sp),
                                        child: Image.memory(
                                          controller.webImageEdit,
                                          height: 30.h,
                                          width: Get.width,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          CustomTextFormFild(
                            mycontroller: nameController,
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
                        ],
                      ),
                    );
                  },
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  Visibility(
                    visible: con.daaAllProductModle == null ? true : false,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        con.deleteDepartment();
                        Get.back();
                        con.getDepartment();
                      },
                      child: Text('Delete'),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('No'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        con.editDerpartmentData();
                        Get.back();
                        con.getDepartment();
                      }
                    },
                    child: Text(
                      'Edit Department !!',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // =============================== PRODUCT WIDGET =============================//

  Future<void> addAlaretWidgetProduct() {
    GlobalKey<FormState> formState = GlobalKey();
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Form(
            key: formState,
            child: GetBuilder<DsahboardScreebControllerIMP>(
              init: DsahboardScreebControllerIMP(),
              builder: (con) => AlertDialog(
                title: Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: haightlightEng,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Builder(
                  builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return SizedBox(
                      height: height - 10.h,
                      width: width - 10.w,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Add New Product to your collection !!',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontFamily: haightlightEng,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 2.h),
                            GetBuilder<DsahboardScreebControllerIMP>(
                              init: DsahboardScreebControllerIMP(),
                              builder: (controller) => InkWell(
                                onTap: controller.pickedImageEdit,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 2.sp),
                                  height: 30.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                                  child: controller.isShowProd == false
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(20.sp),
                                          child: Image.asset(
                                            AppPhotoLink.noUserProfile,
                                            height: 30.h,
                                            width: Get.width,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(20.sp),
                                          child: Image.memory(
                                            controller.webImageProdu,
                                            height: 30.h,
                                            width: Get.width,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            CustomTextFormFild(
                              mycontroller: TextEditingController(),
                              hintText: "enterNameProduct".tr,
                              lable: "nameProduct".tr,
                              suffixIcon: CupertinoIcons.globe,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'noEnterNameProduct'.tr;
                                }
                              },
                            ),
                            CustomTextFormFild(
                              mycontroller: TextEditingController(),
                              maxLength: 8,
                              hintText: "enterNameDescription".tr,
                              lable: "namDescription".tr,
                              suffixIcon: CupertinoIcons.globe,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'noDescription'.tr;
                                }
                              },
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 10.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: DropdownButton<int>(
                                      dropdownColor: Colors.grey,
                                      isExpanded: true,
                                      value: con.itemStart,
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      items: <int>[
                                        1,
                                        2,
                                        3,
                                        4,
                                        5,
                                      ].map<DropdownMenuItem<int>>((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(
                                            value.toString(),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        "Please choose rate".tr,
                                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      onChanged: (int? value) {
                                        con.changeValue(value!);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: DropdownButton<String>(
                                      dropdownColor: Colors.grey,
                                      isExpanded: true,
                                      value: con.itemSize,
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      items: <String>[
                                        'Meduim',
                                        'LARG',
                                        'XL',
                                        'XXL',
                                        'XXXL',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        "Please choose a subject",
                                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      onChanged: (String? value) {
                                        con.changeSize(value!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('No'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      if (formState.currentState!.validate()) {}
                    },
                    child: Text(
                      'Add Product !!',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
