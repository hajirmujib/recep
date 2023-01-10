import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/absensi/models/absensi_model.dart';
import 'package:mysleep/app/modules/admin_absensi/models/admin_absensi_model.dart';

import '../adapter/admin_attendance_adapter.dart';

class AdminAbsensiRepo implements IAdminAbsensiRepo {
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

  @override
  Future<List<AdminAbsensiModel>?> getListAbsensi() async {
    EasyLoading.show(status: 'Memuat...');
    try {
      final res = await RestClient()
          .request(ApiConstants.adminHistoryAttendance, Method.get, {});
      if (res['status'] == 1) {
        EasyLoading.dismiss();
        final data = <AdminAbsensiModel>[];
        for (var i = 0; i < res['data'].length; i++) {
          data.add(AdminAbsensiModel.fromJson(res['data'][i]));
        }
        return data;
      }
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
    }
    return null;
  }
}
