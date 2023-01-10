import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/pallete.dart';

//1 succes
//2 notif
//3 error
showToasts(
    {String title = 'AM-Attendance',
    required String text,
    String status = '1'}) {
  return Get.snackbar(
    title,
    text,
    backgroundColor: Palette.white,
    colorText: Palette.black,
    icon: Icon(Icons.notifications, color: Palette.darkBlue),
    borderColor: Palette.darkBlue,
    borderWidth: 1,
  );
}
