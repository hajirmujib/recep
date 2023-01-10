import 'package:get/get.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final isShowImage = false.obs;
  @override
  void onInit() async {
    final pref = await SharedPreferences.getInstance();

    Future.delayed(Duration(milliseconds: 500), () {
      isShowImage(true);
      Future.delayed(Duration(seconds: 1), () {
        if (pref.getString(PreferenceKey.isLogin) == '1') {
          Get.offAllNamed(Routes.BOTTOM_BAR);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      });
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
