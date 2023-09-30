// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TestScreenController extends GetxController {
  void onCameraTap();
  void onAddNewDepartment();
}

class TestScreenControllerIMP extends TestScreenController {
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

  addNewDepartmentTap() async {}

  Future<void> pickedImage() async {
    if (!kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        //var selected = File(image.path);
        //imgDepartment = selected;
        update();
      } else {
        if (kDebugMode) {
          print('No Image Selected');
        }
      }
    } else if (kIsWeb) {
      //File? _file;
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
        // normal file
//        webImage = result.files.single.bytes!;
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
