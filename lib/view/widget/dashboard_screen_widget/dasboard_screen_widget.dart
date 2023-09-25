// ignore_for_file: prefer_const_constructors

import 'package:dress_web/controller/home_screen_controller/home_screen_controller.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreenWidget extends StatelessWidget {
  const DashboardScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerIMP>(
      init: HomeScreenControllerIMP(),
      builder: (controller) => SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 16),
              controller.screen[controller.index],
            ],
          ),
        ),
      ),
    );
  }
}
