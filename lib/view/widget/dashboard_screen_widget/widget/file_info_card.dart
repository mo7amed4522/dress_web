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
  final VoidCallback onEditPress;
  const FileInfoCard({Key? key, required this.imageURL, required this.onEditPress, required this.nameDepartment, required this.onDepTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDepTap,
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
                Expanded(
                  child: ClipRRect(
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
          Positioned(
            top: 6.h,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.edit,
                size: 10.sp,
                color: Color(0xFFFE270D),
              ),
              onPressed: onEditPress,
            ),
          ),
        ],
      ),
    );
  }
}
