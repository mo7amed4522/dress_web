import 'package:dress_web/view/screen/collection_screen/collection_screen.dart';
import 'package:dress_web/view/screen/dashboard_screen/dashboard_screen.dart';
import 'package:dress_web/view/screen/notification_screen/notification_screen.dart';
import 'package:dress_web/view/screen/profile_screen/profile_screen.dart';
import 'package:dress_web/view/screen/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  void controlMenu();
}

class HomeScreenControllerIMP extends HomeScreenController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  int index = 0;

  @override
  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
      update();
    }
  }

  List<String> titleNames = [
    'Dashboard'.tr,
    'collection'.tr,
    'Notification'.tr,
    'settings'.tr,
    'Profile'.tr,
  ];

  List<Widget> screen = [
    const DashboardScreen(),
    const CollectionScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];

  chabgeIndex(int value) {
    index = value;
    update();
  }
}
