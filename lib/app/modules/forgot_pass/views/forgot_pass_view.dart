import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets_path.dart';
import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../widgets/button_global.dart';
import '../../../widgets/input_field.dart';
import '../controllers/forgot_pass_controller.dart';

class ForgotPassView extends GetView<ForgotPassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Form(
          key: controller.key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.3,
                ),
                Text(
                  "Password recovery",
                  style: FontHeader.h22.copyWith(color: Palette.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your email to recover your password",
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
                  height: 40,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: ButtonGlobal(
                    primary: Palette.black,
                    onTap: () {
                      controller.login();
                    },
                    child: Text(
                      "Sign In",
                      style: FontHeader.h15.copyWith(color: Palette.white),
                    ),
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
