import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/helper/wordt_format.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../widgets/button_global.dart';
import '../../../widgets/photo_hero.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final dataUser = controller.homeController.user;
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Palette.black, //change your color here
        ),
        backgroundColor: Palette.white,
        centerTitle: true,
        elevation: 0.0,
        actions: [
          InkWell(
            radius: 22,
            onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
            child: Image.asset(
              AssetName.iconSeting,
              width: 22,
              height: 22,
              color: Palette.black,
            ).marginOnly(right: 20),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(right: 20),
                  //   width: 65,
                  //   height: 65,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(color: Palette.black),
                  //     image: DecorationImage(
                  //       image: AssetImage(AssetName.imgBatman),
                  //     ),
                  //   ),
                  // ),
                  Obx(() => PhotoHero(
                      photo: dataUser.value.avatar ?? '',
                      onTap: () {
                        // Get.toNamed(Routes.PROFILE);
                      },
                      width: 65)),
                  SizedBox(
                    width: 16,
                  ),
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${dataUser.value.fullName!.getFirstWord()}',
                            style: FontBody.p34.copyWith(color: Palette.black),
                          ),
                          Text(
                            '${dataUser.value.fullName!.getLastWord()}',
                            style: FontBody.p27.copyWith(color: Palette.gray),
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Obx(() => RowCouple(
                    title: 'NIK',
                    subtile: '${dataUser.value.nik}',
                  )),
              Obx(() => RowCouple(
                    title: 'EMAIL',
                    subtile: '${dataUser.value.email}',
                  )),
            ],
          ).marginSymmetric(horizontal: 20, vertical: 16),
          Positioned(
            left: 20,
            bottom: 50,
            child: SizedBox(
              width: 150,
              height: 50,
              child: ButtonGlobal(
                  radius: 26,
                  primary: Palette.black,
                  onTap: () async {
                    final pref = await SharedPreferences.getInstance();
                    pref.remove(PreferenceKey.role);
                    pref.clear();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetName.iconLogout,
                          width: 22,
                          height: 22,
                          color: Palette.white,
                        ).marginOnly(right: 16),
                        Text(
                          'Logout',
                          style: FontBody.p15.copyWith(color: Palette.white),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class RowCouple extends StatelessWidget {
  const RowCouple({
    Key? key,
    required this.title,
    required this.subtile,
  }) : super(key: key);
  final String title;
  final String subtile;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Palette.gray.withOpacity(0.5)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FontBody.s12.copyWith(color: Palette.gray),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subtile,
            style: FontBody.p15.copyWith(color: Palette.black),
          ),
        ],
      ),
    );
  }
}
