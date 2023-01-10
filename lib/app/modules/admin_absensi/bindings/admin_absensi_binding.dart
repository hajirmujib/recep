import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_absensi/adapter/admin_attendance_adapter.dart';
import 'package:mysleep/app/modules/admin_absensi/data/admin_attendance_repository.dart';

import '../controllers/admin_absensi_controller.dart';

class AdminAbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAdminAbsensiRepo>(
      () => AdminAbsensiRepo(),
    );
    Get.lazyPut<AdminAbsensiController>(
      () => AdminAbsensiController(iAdminAbsensiRepo: Get.find()),
    );
  }
}
