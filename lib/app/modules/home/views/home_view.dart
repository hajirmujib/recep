import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';
import 'package:mysleep/app/modules/home/views/components/section_admin.dart';
import 'package:mysleep/app/modules/home/views/components/section_member.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:mysleep/app/widgets/photo_hero.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        backgroundColor: Palette.white,
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Obx(() => Center(
                child: Text(
                  controller.user.value.fullName ?? '',
                  style: FontBody.p15.copyWith(color: Palette.black),
                ).marginOnly(right: 10),
              )),
          Obx(() => PhotoHero(
              photo: controller.user.value.avatar ?? '',
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              width: 40)),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: controller.role.value == "2"
          ? SectionAdmin(controller: controller)
          : SectionMember(controller: controller),
    );
  }
}
