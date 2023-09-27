// ignore_for_file: prefer_final_fields

import 'package:dress_web/core/constant/companent.dart';
import 'package:dress_web/core/constant/curd.dart';
import 'package:dress_web/core/constant/link_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MakeNewDepartmentScreenController extends GetxController {
  void onCameraTap();
  void onAddNewDepartment();
}

class MakeNewDepartmentScreenControllerIMP extends MakeNewDepartmentScreenController {
  bool isPhoto = false;
  Crud _crud = Crud();
  late TextEditingController nameDepartmentController;
  String name = '';

  @override
  void onInit() {
    nameDepartmentController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameDepartmentController.dispose();
    super.dispose();
  }

  addNewDepartmentTap() async {
    await _crud.postRequestWithImage(
        ApiLink.addDepartmentURL,
        {
          'dep_name': nameDepartmentController.text,
        },
        webImage,
        'dep_photo',
        name);
  }

  Future<void> pickedImage() async {
    if (!kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        update();
      } else {
        if (kDebugMode) {
          print('No Image Selected');
        }
      }
    } else if (kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        // load result and files details
        PlatformFile file = result.files.first;
        name = file.name;
        if (kDebugMode) {
          print(file.name);
        }
        isPhoto = true;
        // normal file
        webImage = result.files.single.bytes!;
        update();
        //you have set state to change file ;
      } else {
        // remove the picker
        if (kDebugMode) {
          print('users remove picker');
        }
      }
    } else {
      if (kDebugMode) {
        print('Something error occurred');
      }
    }
    update();
  }

  @override
  void onCameraTap() {
    pickedImage();
  }

  @override
  void onAddNewDepartment() {
    addNewDepartmentTap();
  }
}
