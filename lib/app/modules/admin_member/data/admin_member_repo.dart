import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/admin_member/adapter/admin_member_adapter.dart';
import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';

class AdminMemberRepo implements IAdminMemberRepo {
  @override
  Future<List<MemberModel>?> getMember() async {
    try {
      EasyLoading.show(status: 'Memuat...');
      final res = await RestClient()
          .request(ApiConstants.adminListMember, Method.get, {});
      // log(" DATA DASHBOARD : ${res['data']}");
      if (res['status'] == 1) {
        EasyLoading.dismiss();

        final data = <MemberModel>[];
        for (var i = 0; i < res['data'].length; i++) {
          data.add(MemberModel.fromJson(res['data'][i]));
        }
        return data;
      }
      EasyLoading.dismiss();

      return null;
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
      return null;
    }
  }
}
