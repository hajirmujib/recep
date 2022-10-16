import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailTxt = TextEditingController();
  final pasTxt = TextEditingController();
  final key = GlobalKey<FormState>();

  final isEmailValid = true.obs;
  final isPassValid = true.obs;
  final isPassLength = false.obs;
  final isPassNumber = false.obs;
  final showPass = false.obs;

  changeShowPass() {
    showPass.value = !showPass.value;
  }

  void register() {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
    }
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
