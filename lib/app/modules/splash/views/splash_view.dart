import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.3,
                  ),
                  Center(
                    child: Image.asset(
                      AssetName.imgSplash,
                      width: Get.width * 0.6,
                      height: Get.width * 0.6,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      "AM-Attendance",
                      style: FontHeader.h22.copyWith(color: Palette.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Solusi mudah mengontrol absensi!",
                      style: FontBody.p17.copyWith(color: Palette.gray),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
