import 'package:get/get.dart';
import 'package:mysleep/app/modules/edit_profile/adapter/edit_profile_adapter.dart';
import 'package:mysleep/app/modules/edit_profile/data/edit_profile_repository.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<IEditProfileRepository>(
      () => EditProfileRepository(),
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(iEditProfileRepository: Get.find()),
    );
  }
}
