import 'package:dress_web/model/department_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditDepartmentScreenController extends GetxController {}

class EditDepartmentScreenControllerIMP extends EditDepartmentScreenController {
  DataDepartmentModel? dataDepartmentModel;
  TextEditingController nameDepartmentController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments == null) {
      dataDepartmentModel = null;
    } else {
      dataDepartmentModel = Get.arguments['DepartmentDat'];
      nameDepartmentController.text = dataDepartmentModel!.depName!;
    }
    super.onInit();
  }

  @override
  void dispose() {
    nameDepartmentController.dispose();
    super.dispose();
  }
}
