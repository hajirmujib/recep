import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_request_member/adapter/req_member_adapter.dart';
import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';

class AdminRequestMemberController extends GetxController {
  final IReqMemberRepo iReqMemberRepo;
  AdminRequestMemberController({required this.iReqMemberRepo});
  final listReq = <MemberModel>[].obs;
  final isLoading = false.obs;

  getListReq() async {
    isLoading(true);
    listReq.assignAll(await iReqMemberRepo.getReqMember() ?? []);
    isLoading(false);
  }

  acceptMember({required String id}) async {
    await iReqMemberRepo.acceptMember(id: id).then((value) {
      if (value == true) {
        getListReq();
      }
    });
  }

  rejectMember({required String id}) async {
    await iReqMemberRepo.rejectMember(id: id).then((value) {
      if (value == true) {
        getListReq();
      }
    });
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
