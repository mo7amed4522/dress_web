// ignore_for_file: prefer_final_fields, non_constant_identifier_names, unused_field

import 'package:dress_web/core/constant/curd.dart';
import 'package:dress_web/core/constant/link_api.dart';
import 'package:dress_web/core/constant/loader.dart';
import 'package:dress_web/model/department_model.dart';
import 'package:dress_web/model/get_all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DsahboardScreebController extends GetxController {
  void addNewDepartmentTap();
}

class DsahboardScreebControllerIMP extends DsahboardScreebController {
  Crud _crud = Crud();
  DepartmentModel? _departmentModel;
  List<DataDepartmentModel>? dataDepartmentModel;
  AllProductModle? _allProductModle;
  List<DataAllProductModle>? daaAllProductModle;
  TextEditingController nameDepartmentController = TextEditingController();

  @override
  void onInit() {
    getDepartment();
    super.onInit();
  }

  @override
  void dispose() {
    nameDepartmentController.dispose();
    super.dispose();
  }

  void getDepartment() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.getRequest(ApiLink.viewDepartmentURL);
      if (response['status'] == 'success') {
        _departmentModel = DepartmentModel.fromJson(response);
        Get.back();
        dataDepartmentModel = _departmentModel!.data;
        getAllproductData(dataDepartmentModel![0].depId!);
        update();
      } else {
        Get.back();
        update();
      }
    });
  }

  Future<void> getAllproductData(int dep_id) async {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 2), () async {
      var response = await _crud.postRequest(ApiLink.viewAllProductURL, {'dep_ID': dep_id.toString()});
      if (response['status'] == 'success') {
        _allProductModle = AllProductModle.fromJson(response);
        Get.back();
        daaAllProductModle = _allProductModle!.data;
        update();
      } else {
        Get.back();
        update();
      }
    });
  }

  @override
  void addNewDepartmentTap() {}
}
