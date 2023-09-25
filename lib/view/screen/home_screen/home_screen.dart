// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:dress_web/controller/home_screen_controller/home_screen_controller.dart';
import 'package:dress_web/core/constant/responseve.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/dashboard_screen_widget.dart';
import 'package:dress_web/view/widget/home_screen_widget/slide_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<HomeScreenControllerIMP>(
        init: HomeScreenControllerIMP(),
        builder: (controller) => Scaffold(
          key: controller.scaffoldKey,
          drawer: SideMenu(),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responnsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: DashboardScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
