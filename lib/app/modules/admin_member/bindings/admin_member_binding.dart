import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_member/adapter/admin_member_adapter.dart';
import 'package:mysleep/app/modules/admin_member/data/admin_member_repo.dart';

import '../controllers/admin_member_controller.dart';

class AdminMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAdminMemberRepo>(
      () => AdminMemberRepo(),
    );
    Get.lazyPut<AdminMemberController>(
      () => AdminMemberController(iAdminMemberRepo: Get.find()),
    );
  }
}
