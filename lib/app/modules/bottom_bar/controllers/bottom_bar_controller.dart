import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/modules/absensi/controllers/absensi_controller.dart';
import 'package:mysleep/app/modules/admin_absensi/controllers/admin_absensi_controller.dart';
import 'package:mysleep/app/modules/admin_absensi/views/admin_absensi_view.dart';
import 'package:mysleep/app/modules/admin_member/controllers/admin_member_controller.dart';
import 'package:mysleep/app/modules/admin_member/views/admin_member_view.dart';
import 'package:mysleep/app/modules/admin_setting/controllers/admin_setting_controller.dart';
import 'package:mysleep/app/modules/admin_setting/views/admin_setting_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/assets_path.dart';
import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../core/provider/preferences/preferences_manager.dart';
import '../../../routes/app_pages.dart';
import '../../absensi/views/absensi_view.dart';
import '../../home/views/home_view.dart';

class BottomBarController extends GetxController {
  final SharedPreferencesManager sharedPreferencesManager;

  BottomBarController({required this.sharedPreferencesManager});

  final controller = PersistentTabController(initialIndex: 0).obs;
  final indexTab = 0.obs;
  final role = "".obs;
  final PageController pageController = PageController();

  // final homeC = Get.put(HomeController());
  void changeIndex(int index) {
    indexTab.value = index;
    controller.value.index = index;
    print(controller.value.index);
  }

  final List<Widget> listItemMember = [
    HomeView(),
    AbsensiView(),
  ];

  final List<Widget> listItemAdmin = [
    HomeView(),
    AdminAbsensiView(),
    AdminMemberView(),
    AdminSettingView()
  ];
  // anggota
  List<Widget> buildScreens() {
    return role.value == "2" ? listItemAdmin : listItemMember;
  }

  //list admin

  List<PersistentBottomNavBarItem> navBarsItems() {
    return role.value == "2"
        ? [
            PersistentBottomNavBarItem(
              iconSize: 50,
              contentPadding: 10,
              icon: Image.asset(
                AssetName.iconHome,
                width: 26,
                height: 26,
                color: indexTab.value == 0 ? Palette.white : Palette.gray,
              ),
              onPressed: (context) {
                changeIndex(0);
              },
              textStyle: FontBody.s12,
            ),
            PersistentBottomNavBarItem(
              iconSize: 20,
              icon: Image.asset(
                AssetName.iconDocument,
                width: 24,
                height: 24,
                color: indexTab.value == 1 ? Palette.white : Palette.gray,
              ),
              onPressed: (context) {
                final controller = Get.find<AdminAbsensiController>();
                controller.onInit();
                changeIndex(1);
              },
            ),
            PersistentBottomNavBarItem(
              iconSize: 20,
              icon: Image.asset(
                AssetName.iconUsers,
                width: 24,
                height: 24,
                color: indexTab.value == 2 ? Palette.white : Palette.gray,
              ),
              onPressed: (context) {
                final controller = Get.find<AdminMemberController>();
                controller.onInit();
                changeIndex(2);
              },
            ),
            PersistentBottomNavBarItem(
              iconSize: 20,
              icon: Image.asset(
                AssetName.iconSeting,
                width: 24,
                height: 24,
                color: indexTab.value == 3 ? Palette.white : Palette.gray,
              ),
              onPressed: (context) {
                final controller = Get.find<AdminSettingController>();
                controller.onInit();
                changeIndex(3);
              },
            ),
          ]
        : [
            PersistentBottomNavBarItem(
              iconSize: 50,
              contentPadding: 10,
              icon: Image.asset(
                AssetName.iconHome,
                width: 26,
                height: 26,
                color: indexTab.value == 0 ? Palette.white : Palette.gray,
              ),
              onPressed: (context) {
                changeIndex(0);
              },
              textStyle: FontBody.s12,
            ),
            PersistentBottomNavBarItem(
              iconSize: 20,
              icon: Image.asset(
                AssetName.iconDocument,
                width: 24,
                height: 24,
                color: indexTab.value == 1 ? Palette.white : Palette.gray,
              ),
              onPressed: (context) {
                final controller = Get.find<AbsensiController>();
                controller.onInit();
                changeIndex(1);
              },
            ),
          ];
  }

  @override
  void onInit() async {
    final pref = await SharedPreferences.getInstance();
    role.value = pref.getString(PreferenceKey.role) ?? "";
    if (role.value == "") {
      Get.offAllNamed(Routes.LOGIN);
    }

    print('on init bottom bar');

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
