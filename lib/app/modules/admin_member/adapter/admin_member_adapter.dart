import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';

abstract class IAdminMemberRepo{
  Future<List<MemberModel>?> getMember();
  
}