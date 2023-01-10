import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/absensi/adapter/member_attendance_repository.dart';
import 'package:mysleep/app/modules/absensi/models/absensi_model.dart';

class MemberAbsensiRepo implements IMemberAbsensiRepo {
  @override
  Future<AbsensiModel?> getAbsensi({required String date}) async {
    EasyLoading.show(status: 'Memuat...');
    try {
      final res = await RestClient()
          .request(ApiConstants.historyAttendance, Method.get, {"tgl": date});
      if (res['status'] == 1) {
        EasyLoading.dismiss();
        final data = AbsensiModel.fromJson(res['data']);
        return data;
      }
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
    }
    return null;
  }
}
