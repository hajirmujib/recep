import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PassVerifController extends GetxController
    with GetTickerProviderStateMixin {
  final key = GlobalKey<FormState>();

  final isEmailValid = true.obs;
  void login() {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      dispose();
      Get.toNamed(Routes.RESET_PASS);
    }
  }

  int _counter = 0;
  late AnimationController animateController;
  int levelClock = 60 * 5;

  void reSend() {
    animateController.stop();
    animateController.reset();
    animateController.forward();
  }

  @override
  void onInit() {
    animateController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    animateController.forward();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    print("dispose");
    animateController.dispose();
    // animateController.stop();
    // animateController.reset();
    super.dispose();
  }

  @override
  void onClose() {}
}
