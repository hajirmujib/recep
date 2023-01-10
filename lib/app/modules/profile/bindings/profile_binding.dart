import 'package:get/get.dart';
import 'package:mysleep/app/core/provider/preferences/preferences_manager.dart';
import 'package:mysleep/app/global_binding.dart';
import 'package:mysleep/app/modules/profile/adapter/profile_adapter.dart';
import 'package:mysleep/app/modules/profile/data/profile_repository.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileRepository>(
      () => ProfileRepository(
        sharedPreferencesManager: getIt.get<SharedPreferencesManager>(),
      ),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(iProfileRepository: Get.find()),
    );
  }
}
