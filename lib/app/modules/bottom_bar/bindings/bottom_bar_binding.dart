import 'package:get/get.dart';

import '../../../core/provider/preferences/preferences_manager.dart';
import '../../../global_binding.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(
        sharedPreferencesManager: getIt.get<SharedPreferencesManager>(),
      ),
    );
  }
}
