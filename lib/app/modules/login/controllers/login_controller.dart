import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/modules/login/adapter/login_adapter.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class LoginController extends GetxController {
  final ILoginRepository iLoginRepository;
  LoginController({required this.iLoginRepository});
  final emailTxt = TextEditingController();
  final pasTxt = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: "login");

  final role = "".obs;

  final isEmailValid = true.obs;
  final isPassValid = true.obs;
  final isRoleValid = true.obs;

  final listRole = [
    {"id": "2", "name": "Admin"},
    {"id": "3", "name": "Anggota"}
  ];

  final showPass = false.obs;

  changeShowPass() {
    showPass.value = !showPass.value;
  }

  void login() async {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      await iLoginRepository
          .login(
              email: emailTxt.text, password: pasTxt.text, jabatan: role.value)
          .then((value) {
        if (value != null) {
          emailTxt.clear();
          pasTxt.clear();
          role.value = '';
          Get.offAllNamed(Routes.BOTTOM_BAR);
        }
      });
    } else {
      showToasts(text: 'Harap lengakapi data');
    }
  }

  @override
  void onInit() async {
    print("on init login");

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    emailTxt.dispose();
    pasTxt.dispose();
    super.dispose();
  }

  @override
  void onClose() {}
}
