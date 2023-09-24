import 'package:dress_web/core/routes/app_router.dart';
import 'package:get/get.dart';

abstract class GetStartScreenController extends GetxController {}

class GetStartScreenControllerIMP extends GetStartScreenController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRouter.loginScreen);
    });
    super.onInit();
  }
}
