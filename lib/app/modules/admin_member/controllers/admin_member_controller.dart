import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_member/adapter/admin_member_adapter.dart';
import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';

class AdminMemberController extends GetxController {
  final IAdminMemberRepo iAdminMemberRepo;
  AdminMemberController({required this.iAdminMemberRepo});
  final listReq = <MemberModel>[].obs;
  final isLoading = false.obs;

  getListReq() async {
    isLoading(true);
    listReq.assignAll(await iAdminMemberRepo.getMember() ?? []);
    isLoading(false);
  }

  @override
  void onInit() {
    getListReq();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
