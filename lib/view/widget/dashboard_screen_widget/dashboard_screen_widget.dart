// ignore_for_file: prefer_const_constructors

import 'package:dress_web/core/constant/responseve.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/header.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/my_fields.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/recent_files.dart';
import 'package:dress_web/view/widget/dashboard_screen_widget/widget/storage_details.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: 16),
                      RecentFiles(),
                      if (Responnsive.isMobile(context)) SizedBox(height: 16),
                      if (Responnsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!Responnsive.isMobile(context)) SizedBox(width: 16),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responnsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
