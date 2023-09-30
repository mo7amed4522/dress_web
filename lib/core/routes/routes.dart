import 'package:dress_web/core/routes/app_router.dart';
import 'package:dress_web/view/screen/get_start_screen/get_start_screen.dart';
import 'package:dress_web/view/screen/home_screen/home_screen.dart';
import 'package:dress_web/view/screen/login_screen/login_screen.dart';
import 'package:dress_web/view/screen/test.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRouter.start, page: () => const GetStartScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.loginScreen, page: () => const LoginScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.homeScreen, page: () => const HomeScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.testHomePage, page: () => const TestHomePage(), transition: Transition.fadeIn),
];
