import 'package:get/get.dart';
import 'package:mysleep/app/modules/home/adapter/attendance_adapter.dart';
import 'package:mysleep/app/modules/home/data/attendance_repository.dart';
import 'package:mysleep/app/modules/profile/adapter/profile_adapter.dart';
import 'package:mysleep/app/modules/profile/data/profile_repository.dart';

import '../../../core/provider/preferences/preferences_manager.dart';
import '../../../global_binding.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAttendanceRepository>(
      () => AttendanceRepository(),
    );
    Get.lazyPut<IProfileRepository>(
      () => ProfileRepository(
          sharedPreferencesManager: getIt.get<SharedPreferencesManager>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
          sharedPreferencesManager: getIt.get<SharedPreferencesManager>(),
          iAttendanceRepository: Get.find(),
          iProfileRepository: Get.find()),
    );
  }
}
