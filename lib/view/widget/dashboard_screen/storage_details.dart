// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dress_web/controller/dashboard_screen_controller/dashboard_screen_controller.dart';
import 'package:dress_web/core/constant/companent.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/chart.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/storage_info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageDetails extends GetView<DsahboardScreebControllerIMP> {
  const StorageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2A2D3E),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "conc".tr,
            style: TextStyle(
              fontSize: 18,
              fontFamily: haightlightAR,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          Chart(),
          StorageInfoCard(
            title: "numDepartment".tr,
            amountOfFiles: controller.dataConcoluationModels == null ? '0' : controller.dataConcoluationModels![0].numDep.toString(),
          ),
          StorageInfoCard(
            title: "numProduct".tr,
            amountOfFiles: controller.dataConcoluationModels == null ? '0' : controller.dataConcoluationModels![1].numProd.toString(),
          ),
        ],
      ),
    );
  }
}
