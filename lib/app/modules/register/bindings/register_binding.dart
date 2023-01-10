import 'package:get/get.dart';
import 'package:mysleep/app/modules/register/adapter/register_adapter.dart';
import 'package:mysleep/app/modules/register/data/register_repository.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IRegiterRepository>(
      () => RegisterRepository(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(iRegiterRepository: Get.find()),
    );
  }
}
