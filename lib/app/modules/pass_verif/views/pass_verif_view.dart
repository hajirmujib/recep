import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../widgets/button_global.dart';
import '../controllers/pass_verif_controller.dart';

class PassVerifView extends GetView<PassVerifController> {
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
                  height: Get.height * 0.2,
                ),
                Text(
                  "Check your email",
                  style: FontHeader.h22.copyWith(color: Palette.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We’ve sent the code to your email",
                  style: FontBody.p15.copyWith(color: Palette.gray),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: Get.width,
                  height: 72,
                  child: OtpTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    numberOfFields: 4,
                    borderColor: Palette.primary,
                    textStyle: FontBody.p34.copyWith(color: Palette.black),
                    focusedBorderColor: Palette.primary,
                    cursorColor: Palette.primary,
                    fieldWidth: 72,
                    borderRadius: BorderRadius.circular(20),

                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "code expires in: ",
                      style: FontHeader.h15.copyWith(color: Palette.black),
                    ),
                    // Text(
                    //   "03:12",
                    //   style: FontHeader.h15.copyWith(color: Palette.secondary),
                    // ),
                    Countdown(
                      animation: StepTween(
                        //  begin: gameDataa.levelClock * 60, // convert to seconds here
                        begin: controller.levelClock,
                        end: 0,
                      ).animate(controller.animateController),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: ButtonGlobal(
                    onTap: () {
                      controller.login();
                    },
                    child: Text(
                      "Sign In",
                      style: FontHeader.h15.copyWith(color: Palette.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: ButtonGlobal(
                    sideColor: Palette.gray,
                    primary: Palette.white,
                    onTap: () {
                      controller.reSend();
                    },
                    child: Text(
                      "Send again",
                      style: FontHeader.h15.copyWith(color: Palette.gray),
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

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print(
        'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');
    return Text(
      "$timerText",
      style: FontHeader.h15.copyWith(color: Palette.secondary),
    );
  }
}
