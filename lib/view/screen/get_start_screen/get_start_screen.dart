import 'package:dress_web/controller/get_start_controller/get_start_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetStartScreenControllerIMP>(
        init: GetStartScreenControllerIMP(),
        builder: (controller) => Stack(
          children: [
            Lottie.asset(
              AppPhotoLink.loading,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
                child: Text(
                  'start'.tr,
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 17.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
