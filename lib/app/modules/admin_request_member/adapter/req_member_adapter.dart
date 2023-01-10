import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';

abstract class IReqMemberRepo {
  Future<List<MemberModel>?> getReqMember();
  Future<bool> rejectMember({required String id});
  Future<bool> acceptMember({required String id});


}
