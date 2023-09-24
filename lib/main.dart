import 'dart:io';

import 'package:dress_web/controller/binding/initial_bindings.dart';
import 'package:dress_web/core/routes/routes.dart';
import 'package:dress_web/core/server/serves.dart';
import 'package:dress_web/core/translation/my_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, devicetype) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyTranslation(),
        locale: const Locale('ar'),
        title: 'Dressing'.tr,
        initialBinding: InitialBindings(),
        getPages: routes,
      ),
    );
  }
}
