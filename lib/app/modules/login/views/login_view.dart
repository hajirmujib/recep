import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:mysleep/app/widgets/input_dropdown.dart';
import 'package:mysleep/app/widgets/input_field.dart';

import '../../../widgets/button_global.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Form(
          key: controller.key,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Text(
                      "Selamat Datang!",
                      style: FontHeader.h22.copyWith(color: Palette.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Silahkan login dengan akun anda",
                      style: FontBody.p15.copyWith(color: Palette.gray),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Obx(
                      () => SizedBox(
                        height: controller.isEmailValid.value ? 56 : 79,
                        width: Get.width * 0.9,
                        child: InputField(
                            onChange: (v) {},
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 10),
                              child: Image.asset(
                                AssetName.iconMessage,
                                width: 24,
                                height: 24,
                                color: controller.isEmailValid.value
                                    ? Palette.primary
                                    : Palette.black,
                              ),
                            ),
                            controller: controller.emailTxt,
                            hintText: "Email",
                            validator: (val) {
                              if (val!.isEmpty) {
                                controller.isEmailValid(false);

                                return "Please insert email";
                              } else {
                                if (EmailValidator.validate(val)) {
                                  controller.isEmailValid(true);
                                  return null;
                                } else {
                                  controller.isEmailValid(false);
                                  return "Email not valid";
                                }
                              }
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: controller.isPassValid.value ? 56 : 79,
                        width: Get.width * 0.9,
                        child: InputField(
                          onChange: (v) {},
                          obscure: !controller.showPass.value,
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 10),
                            child: Image.asset(
                              AssetName.iconLock,
                              width: 24,
                              height: 24,
                              color: controller.isPassValid.value
                                  ? Palette.primary
                                  : Palette.black,
                            ),
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: IconButton(
                                onPressed: () {
                                  controller.changeShowPass();
                                },
                                icon: Icon(
                                  controller.showPass.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 24,
                                  color: Palette.gray,
                                )),
                          ),
                          controller: controller.pasTxt,
                          hintText: "Password",
                          validator: (val) {
                            // controller.changeEmail();
                            if (val!.isEmpty) {
                              controller.isPassValid(false);

                              return "Please insert password";
                            } else {
                              controller.isPassValid(true);
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width * 0.9,
                      height: 56,
                      child: Obx(() => InputDropdown(
                            hintText: "Jabatan",
                            list: controller.listRole,
                            value: controller.role.value,
                            onChange: (e) {
                              controller.role.value = e.toString();
                            },
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.FORGOT_PASS);
                        },
                        child: Text(
                          "Lupa Kata Sandi?",
                          style: FontBody.p15.copyWith(color: Palette.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ).marginSymmetric(horizontal: 20),
              ),
              Positioned(
                bottom: Get.height * 0.02,
                child: ButtonSectionLogin(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSectionLogin extends StatelessWidget {
  const ButtonSectionLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width * 0.9,
          child: ButtonGlobal(
            primary: Palette.black,
            onTap: () {
              controller.login();
              
            },
            child: Text(
              "Masuk",
              style: FontHeader.h15.copyWith(color: Palette.white),
            ),
          ),
        ).marginSymmetric(horizontal: 20),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum punya akun?",
              style: FontBody.p15.copyWith(color: Palette.black),
            ).marginOnly(right: 10),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.REGISTER);
              },
              child: Text(
                "Daftar",
                style: FontBody.p15.copyWith(color: Palette.primary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
