// ignore_for_file: body_might_complete_normally_nullable, override_on_non_overriding_member

import 'package:dress_web/controller/edit_department_screen_controller/edit_department_screen_controller.dart';
import 'package:dress_web/core/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleWareDep extends GetMiddleware {
  var editController = Get.put(EditDepartmentScreenControllerIMP());
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (editController.dataDepartmentModel == null) {
      return const RouteSettings(name: AppRouter.homeScreen);
    } else {
      return const RouteSettings(name: AppRouter.editDepartmentScreen);
    }
  }
}
