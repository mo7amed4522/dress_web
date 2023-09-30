// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, body_might_complete_normally_nullable

import 'package:dress_web/controller/dashboard_screen_controller/dashboard_screen_controller.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:dress_web/core/constant/responseve.dart';
import 'package:dress_web/view/widget/dashboard_screen/alter_dialog_show_widget.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/file_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
                style: TextStyle(
                  color: Color(0xFFFE270D),
                  fontFamily: haightlightAR,
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
                onPressed: AlterWidgetDialog().showAlterDialogAdd,
                icon: Icon(Icons.add),
                label: Text(
                  "Add New".tr,
                  style: TextStyle(
                    fontFamily: haightlightAR,
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
                onDoubleTap: () {
                  controller.getDataDepartmentEdit(index).then((value) {
                    controller.nameEditDepartmentController.text = value.depName!;
                    return AlterWidgetDialog().showAlterDialogEdit(
                      imgeURL: value.depPhoto!,
                      nameController: controller.nameEditDepartmentController,
                    );
                  });
                },
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
