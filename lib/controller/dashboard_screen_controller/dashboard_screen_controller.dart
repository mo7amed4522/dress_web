// ignore_for_file: prefer_final_fields, non_constant_identifier_names, unused_field, no_leading_underscores_for_local_identifiers

import 'package:dress_web/core/constant/curd.dart';
import 'package:dress_web/core/constant/link_api.dart';
import 'package:dress_web/core/constant/loader.dart';
import 'package:dress_web/core/routes/app_router.dart';
import 'package:dress_web/model/data_concoluation_model.dart';
import 'package:dress_web/model/department_model.dart';
import 'package:dress_web/model/get_all_product_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DsahboardScreebController extends GetxController {
  void goToTestScreen();
  void onCameraTap();
  void onAddNewDepartment();
  Future<void> deleteDepartment();
}

class DsahboardScreebControllerIMP extends DsahboardScreebController {
  Crud _crud = Crud();
  DepartmentModel? _departmentModel;
  List<DataDepartmentModel>? dataDepartmentModel;
  DataDepartmentModel? dataDepartmentModelEdit;
  AllProductModle? _allProductModle;
  List<DataAllProductModle>? daaAllProductModle;
  TextEditingController nameDepartmentController = TextEditingController();
  TextEditingController nameEditDepartmentController = TextEditingController();
  String name = '';
  String nameEdit = '';
  bool isShow = false;
  bool isShowEdit = false;
  Uint8List webImage = Uint8List(8);
  Uint8List webImageEdit = Uint8List(8);
  DataCoColuationModel? _dataCoColuationModel;
  List<DataConcolutonModel>? dataConcoluationModels;
// ============================= PRODUCT =============================//
  bool isShowProd = false;
  Uint8List webImageProdu = Uint8List(8);
  int? itemStart;
  String? itemSize;
// ============================= FUNCHION =============================//
  @override
  void onInit() {
    getDepartment();
    getConcoluation();
    super.onInit();
  }

  @override
  void dispose() {
    nameDepartmentController.dispose();
    super.dispose();
  }

  void changeValue(int value) {
    itemStart = value;
    update();
  }

  void changeSize(String value) {
    itemSize = value;
    update();
  }

  Future<void> getConcoluation() async {
    var response = await _crud.getRequest(ApiLink.getConcoluationURL);
    if (response['status'] == 'success') {
      _dataCoColuationModel = DataCoColuationModel.fromJson(response);
      dataConcoluationModels = _dataCoColuationModel!.data;
      update();
    } else {
      update();
    }
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
        daaAllProductModle = null;
        Get.back();
        update();
      }
    });
  }

  Future<void> pickedImage() async {
    webImage;
    update();
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
        webImage = result.files.single.bytes!;
        isShow = true;
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

  Future<void> pickedImageEdit() async {
    webImageEdit = Uint8List(8);
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
      //File? _file;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        // load result and files details
        PlatformFile file = result.files.first;
        nameEdit = file.name;
        if (kDebugMode) {
          print(file.name);
        }
        // normal file
        webImageEdit = result.files.single.bytes!;
        isShowEdit = true;
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

  addNewDepartmentTap() async {
    await _crud.postRequestWithImage(
      ApiLink.addDepartmentURL,
      {
        'dep_name': nameDepartmentController.text,
      },
      webImage,
      'dep_photo',
      name,
    );
  }

  @override
  void goToTestScreen() {
    Get.toNamed(AppRouter.testHomePage);
  }

  @override
  void onCameraTap() {
    pickedImage();
  }

  @override
  void onAddNewDepartment() {
    addNewDepartmentTap();
  }

  Future<DataDepartmentModel> getDataDepartmentEdit(int index) async {
    dataDepartmentModelEdit = dataDepartmentModel![index];
    return dataDepartmentModelEdit!;
  }

  Future<void> editDerpartmentData() async {
    if (isShowEdit == false) {
      await _crud.postRequest(ApiLink.updateDepartmentURL, {
        'dep_id': dataDepartmentModelEdit!.depId.toString(),
        'dep_name': nameEditDepartmentController.text == '' ? dataDepartmentModelEdit!.depName : nameEditDepartmentController.text,
      });
    } else {
      await _crud.postRequestWithImage(
        ApiLink.updateDepartmentURL,
        {
          'dep_id': dataDepartmentModelEdit!.depId.toString(),
          'dep_name': nameEditDepartmentController.text == '' ? dataDepartmentModelEdit!.depName : nameEditDepartmentController.text,
        },
        webImageEdit,
        'dep_photo',
        nameEdit,
      );
    }
  }

  @override
  Future<void> deleteDepartment() async {
    await _crud.postRequest(ApiLink.deleteDepartmentURL, {'dep_id': dataDepartmentModelEdit!.depId.toString()});
  }
}
