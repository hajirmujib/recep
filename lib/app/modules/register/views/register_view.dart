import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets_path.dart';
import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/button_global.dart';
import '../../../widgets/input_dropdown.dart';
import '../../../widgets/input_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Form(
            key: controller.key,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Text(
                  "Daftar",
                  style: FontHeader.h22.copyWith(color: Palette.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Silahkan Isi Form Dengan Lengkap",
                  style: FontBody.p15.copyWith(color: Palette.gray),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Obx(
                    () => Stack(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: 20),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Palette.black),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: controller.filePath.value.isEmpty
                                  ? AssetImage(AssetName.imgBatman)
                                  : FileImage(File(controller.filePath.value))
                                      as ImageProvider,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: InkWell(
                            onTap: () => controller.getImage(true),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Palette.secondary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Palette.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => SizedBox(
                    height: controller.isNameValid.value ? 56 : 79,
                    width: Get.width * 0.9,
                    child: InputField(
                        isNumber: false,
                        onChange: (v) {},
                        controller: controller.nameTxt,
                        hintText: "Nama",
                        validator: (val) {
                          // controller.changeEmail();
                          if (val!.isEmpty) {
                            controller.isNameValid(false);

                            return "Please insert Name";
                          } else {}
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => SizedBox(
                    height: controller.isEmailValid.value ? 56 : 79,
                    width: Get.width * 0.9,
                    child: InputField(
                        onChange: (v) {},
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 10),
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
                          // controller.changeEmail();
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
                    height: controller.isNikValid.value ? 56 : 79,
                    width: Get.width * 0.9,
                    child: InputField(
                        isNumber: true,
                        onChange: (v) {},
                        controller: controller.nikTxt,
                        hintText: "NIK",
                        validator: (val) {
                          // controller.changeEmail();
                          if (val!.isEmpty) {
                            controller.isEmailValid(false);

                            return "Please insert NIK";
                          } else {}
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
                        onChange: (val) {
                          print("onchange : " + val!.length.toString());
                          if (val.length >= 6) {
                            controller.isPassLength(true);
                          } else {
                            controller.isPassLength(false);
                          }

                          if (val.contains(RegExp(r'[0-9]'))) {
                            controller.isPassNumber(true);
                          } else {
                            print("not number");
                            controller.isPassNumber(false);
                          }
                          if (val.isEmpty) {
                            controller.isPassLength(false);
                            controller.isPassNumber(false);
                          }
                          return null;
                        },
                        validator: (val) {
                          // controller.changeEmail();
                          if (val!.isEmpty) {
                            controller.isPassValid(false);

                            return "Please insert password";
                          } else {
                            if (val.length < 6) {
                              controller.isPassLength(false);
                            } else if (val.contains(RegExp(r'[0-9]'))) {
                              controller.isPassNumber(false);
                            } else {
                              controller.isPassValid(true);
                              return null;
                            }
                          }
                        }),
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
                  height: 100,
                ),
                SizedBox(
                  width: Get.width,
                  child: ButtonGlobal(
                    primary: Palette.black,
                    onTap: () {
                      controller.register();
                    },
                    child: Text(
                      "Daftar",
                      style: FontHeader.h15.copyWith(color: Palette.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah Punya Akun?",
                      style: FontBody.p15.copyWith(color: Palette.black),
                    ).marginOnly(right: 10),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Masuk",
                        style: FontBody.p15.copyWith(color: Palette.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ).marginSymmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
