import 'package:dress_web/controller/login_screen_controller/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginScreenControllerIMP>(
        init: LoginScreenControllerIMP(),
        builder: (controller) => Container(),
      ),
    );
  }
}
