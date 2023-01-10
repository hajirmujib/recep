import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/home/adapter/attendance_adapter.dart';
import 'package:mysleep/app/modules/home/models/dashboard_model.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class AttendanceRepository implements IAttendanceRepository {
  @override
  Future<bool> attendanceIn(
      {required String tglMasuk,
      required String latitude,
      required String longitude}) async {
    final data = {
      'tgl_masuk': tglMasuk,
      'latitude': latitude,
      'longitude': longitude,
    };
    final res = await RestClient()
        .request(ApiConstants.attendanceIn, Method.post, data);

    if (res['status'] == true) {
      return true;
    } else {
      showToasts(text: res['message']);
      return false;
    }
  }

  @override
  Future<bool> attendanceOut({required String tglKeluar}) async {
    final data = {
      'tgl_keluar': tglKeluar,
    };
    try {
      final res = await RestClient()
          .request(ApiConstants.attendanceIn, Method.post, data);

      if (res['status'] == true) {
        return true;
      } else {
        showToasts(text: res['message']);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<DashboardModel?> dashboard() async {
    log('GET DASHBOARD');
    try {
      final res = await RestClient()
          .request(ApiConstants.adminDashboard, Method.get, {});
      // log(" DATA DASHBOARD : ${res['data']}");
      if (res['status'] == 1) {
        final data = DashboardModel.fromJson(res['data']);

        return data;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<bool?> sendKode({required String kodeRef}) async {
    EasyLoading.show(status: 'Mengirim...');
    final data = {
      'kode_referal': kodeRef,
    };
    try {
      final res =
          await RestClient().request(ApiConstants.sendKode, Method.post, data);

      if (res['status'] == 1) {
        EasyLoading.dismiss();

        showToasts(text: res['message']);

        return true;
      } else {
        EasyLoading.dismiss();

        showToasts(text: res['message']);
        return false;
      }
    } catch (e) {
      log(e.toString());
      EasyLoading.dismiss();

      showToasts(text: 'Terjadi kesalahan!');

      return false;
    }
  }
}
