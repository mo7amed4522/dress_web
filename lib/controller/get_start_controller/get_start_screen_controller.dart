import 'package:dress_web/core/routes/app_router.dart';
import 'package:dress_web/core/server/serves.dart';
import 'package:get/get.dart';

abstract class GetStartScreenController extends GetxController {}

class GetStartScreenControllerIMP extends GetStartScreenController {
  MyServices myServices = Get.find();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      if (myServices.sharedPreferences.getBool('isLogin') == true) {
        Get.toNamed(AppRouter.homeScreen);
      } else {
        Get.toNamed(AppRouter.loginScreen);
      }
    });
    super.onInit();
  }
}
