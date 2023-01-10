import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_request_member/adapter/req_member_adapter.dart';
import 'package:mysleep/app/modules/admin_request_member/data/req_member_repo.dart';

import '../controllers/admin_request_member_controller.dart';

class AdminRequestMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IReqMemberRepo>(
      () => ReqMemberRepository(),
    );
    Get.lazyPut<AdminRequestMemberController>(
      () => AdminRequestMemberController(iReqMemberRepo: Get.find()),
    );
  }
}
