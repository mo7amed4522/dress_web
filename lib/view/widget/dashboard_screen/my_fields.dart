// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dress_web/controller/dashboard_screen_controller/dashboard_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:dress_web/core/constant/responseve.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../dashboard_screen_widget/widget/file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return GetBuilder<DsahboardScreebControllerIMP>(
      init: DsahboardScreebControllerIMP(),
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Files".tr,
                style: GoogleFonts.notoKufiArabic(
                  color: Color(0xFFFE270D),
                  fontSize: 3.sp,
                ),
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  iconColor: Color(0xFFFE270D),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * 1.5,
                    vertical: 16 / (Responnsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {
                  AwesomeDialog(
                    dismissOnTouchOutside: false,
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.noHeader,
                    body: Column(
                      children: [
                        Center(
                          child: Text(
                            'addnewDep'.tr,
                            style: GoogleFonts.notoKufiArabic(
                              fontSize: 7.sp,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormFild(
                          mycontroller: controller.nameDepartmentController,
                          hintText: "enterDepartment".tr,
                          lable: "department".tr,
                          suffixIcon: CupertinoIcons.globe,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {},
                        ),
                        SizedBox(height: 2.h),
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 4.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'choicePhoto'.tr,
                                  style: GoogleFonts.notoKufiArabic(
                                    fontSize: 7.sp,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 3.sp),
                                SvgPicture.asset(
                                  AppPhotoLink.uploadIcon,
                                  width: 4.sp,
                                  height: 4.h,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    btnOkOnPress: () {},
                    btnOkText: 'ok'.tr,
                    btnCancelText: 'cancel'.tr,
                    btnCancelOnPress: () {},
                  ).show();
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Add New".tr,
                  style: GoogleFonts.notoKufiArabic(
                    color: Color(0xFFFE270D),
                    fontSize: 3.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Responnsive(
            mobile: FileInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
            ),
            tablet: FileInfoCardGridView(),
            desktop: FileInfoCardGridView(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({Key? key, this.crossAxisCount = 4, this.childAspectRatio = 1}) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DsahboardScreebControllerIMP>(
      init: DsahboardScreebControllerIMP(),
      builder: (controller) => controller.dataDepartmentModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.dataDepartmentModel!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) => FileInfoCard(
                onDepTap: () {
                  controller.getAllproductData(controller.dataDepartmentModel![index].depId!);
                },
                imageURL: controller.dataDepartmentModel![index].depPhoto!,
                nameDepartment: controller.dataDepartmentModel![index].depName!,
              ),
            ),
    );
  }
}
