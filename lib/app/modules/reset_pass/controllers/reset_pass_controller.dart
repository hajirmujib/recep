import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
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
  void dispose() {
    pasTxt.dispose();
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
