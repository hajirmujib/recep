import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/routes/app_pages.dart';

class ForgotPassController extends GetxController {
  final emailTxt = TextEditingController();
  final key = GlobalKey<FormState>();

  final isEmailValid = true.obs;
  void login() {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      Get.toNamed(Routes.PASS_VERIF);
    }
  }

  @override
  void dispose() {
    emailTxt.dispose();

    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
