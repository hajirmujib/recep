import 'package:get/get.dart';
import 'package:mysleep/app/modules/absensi/adapter/member_attendance_repository.dart';
import 'package:mysleep/app/modules/absensi/data/absens_repository.dart';

import '../controllers/absensi_controller.dart';

class AbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMemberAbsensiRepo>(
      () => MemberAbsensiRepo(),
    );
    Get.lazyPut<AbsensiController>(
      () => AbsensiController(iMemberAbsensiRepo: Get.find()),
    );
  }
}
