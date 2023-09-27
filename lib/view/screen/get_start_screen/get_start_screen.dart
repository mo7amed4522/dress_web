import 'package:dress_web/controller/get_start_controller/get_start_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            Image.asset(
              AppPhotoLink.logo,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'start'.tr,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontFamily: haightlightAR,
                      ),
                    ),
                    SizedBox(width: 3.sp),
                    Text(
                      'Dressing'.tr,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color(0xFFFE270D),
                        fontFamily: haightlightEng,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
