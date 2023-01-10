import 'package:get/get.dart';
import 'package:mysleep/app/modules/login/adapter/login_adapter.dart';
import 'package:mysleep/app/modules/login/data/login_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginRepository>(
      () => LoginRepository(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(iLoginRepository: Get.find()),
    );
  }
}
