// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:dress_web/controller/dashboard_screen_controller/dashboard_screen_controller.dart';
import 'package:dress_web/core/constant/app_photo.dart';
import 'package:dress_web/core/constant/responseve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DsahboardScreebControllerIMP>(
      init: DsahboardScreebControllerIMP(),
      builder: (controller) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF2A2D3E),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product".tr,
                  style: GoogleFonts.notoKufiArabic(
                    color: Color(0xFFFE270D),
                    fontSize: 5.sp,
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
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text(
                    "Addproduct".tr,
                    style: GoogleFonts.notoKufiArabic(
                      color: Color(0xFFFE270D),
                      fontSize: 3.sp,
                    ),
                  ),
                ),
              ],
            ),
            controller.daaAllProductModle == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: 16,
                      // minWidth: 600,
                      columns: [
                        DataColumn(
                          label: Text("nameProd".tr),
                        ),
                        DataColumn(
                          label: Text("codeProd".tr),
                        ),
                        DataColumn(
                          label: Text("amountProd".tr),
                        ),
                      ],
                      rows: List.generate(
                        controller.daaAllProductModle!.length,
                        (index) => recentFileDataRow(
                          nameProd: controller.daaAllProductModle![index].name!,
                          codeProd: controller.daaAllProductModle![index].prodId!.toString(),
                          amountProd: controller.daaAllProductModle![index].amount!.toString(),
                          onCellTap: () {},
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

DataRow recentFileDataRow({
  required String nameProd,
  required String amountProd,
  required String codeProd,
  required VoidCallback onCellTap,
}) {
  return DataRow(
    cells: [
      DataCell(
        onTap: onCellTap,
        Row(
          children: [
            SvgPicture.asset(
              AppPhotoLink.productIcon,
              height: 30,
              width: 30,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(nameProd),
            ),
          ],
        ),
      ),
      DataCell(Text(codeProd)),
      DataCell(Text(amountProd)),
    ],
  );
}
