// ignore_for_file: file_names

import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if (type == "Username") {
    if (!GetUtils.isUsername(value)) {
      return "not valid Full Name";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "not valid E-Mail".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "not valid PhoneNumber";
    }
  }
  if (value.isEmpty) {
    return "Can't be empty";
  }
  if (value.length < min) {
    return "لا يمكن ان يكون اقل من  $min";
  }
  if (value.length > max) {
    return "لا يمكن ان يكون اكثر من  $max";
  }
}
