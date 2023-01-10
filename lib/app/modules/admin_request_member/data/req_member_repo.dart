import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/admin_request_member/adapter/req_member_adapter.dart';
import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class ReqMemberRepository implements IReqMemberRepo {
  @override
  Future<List<MemberModel>?> getReqMember() async {
    try {
      EasyLoading.show(status: 'Memuat...');
      final res = await RestClient()
          .request(ApiConstants.adminListRequestMember, Method.get, {});
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

  @override
  Future<bool> acceptMember({required String id}) async {
    try {
      EasyLoading.show(status: 'Memuat...');
      final res = await RestClient()
          .request(ApiConstants.adminAcceptMember, Method.post, {'id': id});
      // log(" DATA DASHBOARD : ${res['data']}");
      if (res['status'] == 1) {
        EasyLoading.dismiss();
        showToasts(text: res['message']);

        return true;
      }
      EasyLoading.dismiss();

      return false;
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> rejectMember({required String id}) async {
    EasyLoading.show(status: 'Memuat...');
    final res = await RestClient()
        .request(ApiConstants.adminRejectMember, Method.post, {'id': id});
    log(" DATA DASHBOARD : ${res}");
    if (res['status'] == 1) {
      showToasts(text: res['message']);

      EasyLoading.dismiss();

      return true;
    }
    EasyLoading.dismiss();

    return false;
  }
}
