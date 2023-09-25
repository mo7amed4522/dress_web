// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormFild extends StatelessWidget {
  final String? hintText;
  final String? lable;
  final IconData? suffixIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?) validator;
  final TextInputType? textInputType;
  bool? enabled = true;
  final bool? isShowText;
  final void Function()? sufficsIconTap;
  CustomTextFormFild({super.key, this.sufficsIconTap, this.isShowText, this.textInputType, required this.validator, this.mycontroller, this.hintText, this.lable, this.suffixIcon, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 4, right: 4),
      child: TextFormField(
        enabled: enabled,
        keyboardType: textInputType,
        obscureText: isShowText == null || isShowText == false ? false : true,
        validator: validator,
        style: GoogleFonts.notoKufiArabic(
          fontSize: 4.sp,
        ),
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: InkWell(
              onTap: sufficsIconTap,
              child: Icon(
                suffixIcon,
                color: const Color(0xff5DB1DF),
              )),
          label: Container(margin: const EdgeInsets.symmetric(horizontal: 9), child: Text(lable!)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class ButtomLoginWidget extends StatelessWidget {
  const ButtomLoginWidget({super.key, required this.ontap, required this.buttonName});

  final VoidCallback ontap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Get.width / 1.12,
        height: Get.height / 15,
        decoration: ShapeDecoration(
          color: Color(0xFFFE270D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadows: [BoxShadow(color: Color(0x19C94210), blurRadius: 30, offset: Offset(0, 10), spreadRadius: 0)],
        ),
        alignment: Alignment.center,
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: GoogleFonts.notoKufiArabic(
            fontSize: 4.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
