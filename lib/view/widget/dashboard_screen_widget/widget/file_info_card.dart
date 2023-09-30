// ignore_for_file: prefer_const_constructors

import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FileInfoCard extends StatelessWidget {
  final String imageURL;
  final String nameDepartment;
  final VoidCallback onDepTap;
  final VoidCallback onDoubleTap;
  const FileInfoCard({Key? key, required this.imageURL, required this.onDoubleTap, required this.nameDepartment, required this.onDepTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDepTap,
      onDoubleTap: onDoubleTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2A2D3E),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image.network(
                    imageURL,
                    width: Get.width,
                    height: 9.h,
                    fit: BoxFit.cover,
                    errorBuilder: (c, n, y) => Image.asset(
                      AppPhotoLink.logo,
                      height: 4.h,
                      width: Get.width,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 1.h, top: 2),
                  child: Text(
                    nameDepartment,
                    style: TextStyle(
                      fontSize: 5.sp,
                      fontFamily: haightlightAR,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
