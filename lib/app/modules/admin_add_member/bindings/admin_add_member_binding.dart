import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_add_member/adapter/add_member_adapter.dart';
import 'package:mysleep/app/modules/admin_add_member/data/add_member_repository.dart';

import '../controllers/admin_add_member_controller.dart';

class AdminAddMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAddMemberRepository>(
      () => AddMemberRepository(),
    );
    Get.lazyPut<AdminAddMemberController>(
      () => AdminAddMemberController(iAddMemberRepository: Get.find()),
    );
  }
}
