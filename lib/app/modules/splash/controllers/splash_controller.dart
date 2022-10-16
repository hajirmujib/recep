import 'package:get/get.dart';

class SplashController extends GetxController {
  final isShowImage = false.obs;
  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 500), () {
      isShowImage(true);
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
