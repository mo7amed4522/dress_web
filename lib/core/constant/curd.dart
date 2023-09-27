// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        if (kDebugMode) {
          print("Error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch $e");
      }
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        if (kDebugMode) {
          print("Error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch $e");
      }
    }
  }

  postRequestWithImage(String url, Map data, Uint8List? file, String field, String name) async {
    var request = http.MultipartRequest("POST", Uri.parse(url))..files.add(http.MultipartFile.fromBytes(field, file!, filename: name));
    if (kDebugMode) {
      print(request.files.toString());
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    if (myrequest.statusCode == 200) {
      if (kDebugMode) {
        print('Image uploaded successfully');
      }
    } else {
      if (kDebugMode) {
        print('Image upload failed with status code ${myrequest.statusCode}');
      }
    }
  }
}
