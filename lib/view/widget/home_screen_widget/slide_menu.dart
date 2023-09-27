// ignore_for_file: prefer_const_constructors

import 'package:dress_web/controller/home_screen_controller/home_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetBuilder<HomeScreenControllerIMP>(
        init: HomeScreenControllerIMP(),
        builder: (controller) => ListView(
          children: [
            DrawerHeader(
              child: Image.asset(AppPhotoLink.logo),
            ),
            DrawerListTile(
              title: "Dashboard".tr,
              svgSrc: AppPhotoLink.dashboardIcon,
              press: () {
                controller.chabgeIndex(0);
              },
            ),
            DrawerListTile(
              title: "collection".tr,
              svgSrc: AppPhotoLink.collectionIcon,
              press: () {
                controller.chabgeIndex(1);
              },
            ),
            DrawerListTile(
              title: "Notification".tr,
              svgSrc: AppPhotoLink.notifcationIcon,
              press: () {
                controller.chabgeIndex(2);
              },
            ),
            DrawerListTile(
              title: "settings".tr,
              svgSrc: AppPhotoLink.settingIcon,
              press: () {
                controller.chabgeIndex(3);
              },
            ),
            DrawerListTile(
              title: "Profile".tr,
              svgSrc: AppPhotoLink.profileIcon,
              press: () {
                controller.chabgeIndex(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white54,
          fontSize: 4.sp,
          fontFamily: haightlightAR,
        ),
      ),
    );
  }
}
