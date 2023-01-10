import 'package:get/get.dart';

import '../controllers/pass_verif_controller.dart';

class PassVerifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassVerifController>(
      () => PassVerifController(),
    );
  }
}
