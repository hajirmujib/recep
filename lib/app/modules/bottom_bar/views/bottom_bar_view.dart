import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../constants/pallete.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: PersistentTabView(
            context,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(26),
            ),
            controller: controller.controller.value,
            screens: controller.buildScreens(),
            items: controller.navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Palette.black, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

            popAllScreensOnTapOfSelectedTab: false,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style12, // Choose the nav bar style with this property.
          ),
        ));
  }
}
