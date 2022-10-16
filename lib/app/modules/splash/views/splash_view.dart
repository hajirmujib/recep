import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:mysleep/app/widgets/button_global.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(
            () => AnimatedOpacity(
              curve: Curves.slowMiddle,
              duration: Duration(milliseconds: 500),
              opacity: controller.isShowImage.value ? 1.0 : 0.0,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        AssetName.imgOnboard,
                        fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Start Cooking",
                          style: FontHeader.h22.copyWith(color: Palette.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Let’s join our communityto\ncook better food!",
                          style: FontBody.p17.copyWith(color: Palette.gray),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                    child: Center(
                      child: SizedBox(
                        width: Get.width * 0.9,
                        child: ButtonGlobal(
                          onTap: () {
                            Get.offAllNamed(
                              Routes.LOGIN,
                            );
                          },
                          child: Text(
                            "Get Started",
                            style:
                                FontHeader.h15.copyWith(color: Palette.white),
                          ),
                        ),
                      ).marginSymmetric(horizontal: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
