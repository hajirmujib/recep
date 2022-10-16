import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets_path.dart';
import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../widgets/button_global.dart';
import '../../../widgets/input_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.2,
              ),
              Text(
                "Welcome!",
                style: FontHeader.h22.copyWith(color: Palette.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please enter your account here",
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
                      hintText: "Email or phone number",
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
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Password must contain:",
                      style: FontBody.p15.copyWith(color: Palette.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Obx(() => Image.asset(
                              controller.isPassLength.value
                                  ? AssetName.iconChecked
                                  : AssetName.iconUncheck,
                              width: 24,
                              height: 24,
                            )).marginOnly(right: 10),
                        Text(
                          "Atleast 6 characters",
                          style: FontBody.p15.copyWith(color: Palette.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Obx(() => Image.asset(
                              controller.isPassNumber.value
                                  ? AssetName.iconChecked
                                  : AssetName.iconUncheck,
                              width: 24,
                              height: 24,
                            )).marginOnly(right: 10),
                        Text(
                          "Contains a number",
                          style: FontBody.p15.copyWith(color: Palette.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: ButtonGlobal(
                  onTap: () {
                    controller.register();
                  },
                  child: Text(
                    "Sign Up",
                    style: FontHeader.h15.copyWith(color: Palette.white),
                  ),
                ),
              ),
            ],
          ).marginSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
