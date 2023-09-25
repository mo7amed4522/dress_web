// ignore_for_file: prefer_const_constructors

import 'package:dress_web/controller/home_screen_controller/home_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/responseve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerIMP>(
      init: HomeScreenControllerIMP(),
      builder: (controller) => Row(
        children: [
          if (!Responnsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: controller.controlMenu,
            ),
          if (!Responnsive.isMobile(context))
            Text(
              "Dashboard".tr,
              style: GoogleFonts.notoKufiArabic(
                fontSize: 6.sp,
                color: Color(0xFFFE270D),
              ),
            ),
          if (!Responnsive.isMobile(context)) Spacer(flex: Responnsive.isDesktop(context) ? 2 : 1),
          Expanded(child: SearchField()),
          ProfileCard()
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16 / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF2A2D3E),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            AppPhotoLink.profile,
            height: 38,
          ),
          if (!Responnsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 / 2),
              child: Text("Dew Ahmed"),
            ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search".tr,
        fillColor: Color(0xFF2A2D3E),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(16 * 0.75),
            margin: EdgeInsets.symmetric(horizontal: 16 / 2),
            decoration: BoxDecoration(
              color: Color(0xFFFE270D),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(AppPhotoLink.searchIcon),
          ),
        ),
      ),
    );
  }
}
