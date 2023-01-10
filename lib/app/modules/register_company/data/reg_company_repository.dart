import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/register_company/adapter/regiser_company_adapter.dart';
import 'package:mysleep/app/modules/register_company/models/company_model.dart';
import 'package:mysleep/app/widgets/show_tost.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/preference_key.dart';

class RegCompanyRepository implements IRegCompanyRepository {
  @override
  Future<OfficeModel?> registerCompany(
      {required String nama,
      required String alamat,
      required String jangkauan,
      required String latitude,
      required String longitude}) async {
    EasyLoading.show();
    final pref = await SharedPreferences.getInstance();

    final data = {
      'nama': nama,
      'alamat': alamat,
      'jangkauan': jangkauan,
      'latitude': latitude,
      'longitude': longitude,
    };
    final res = await RestClient()
        .request(ApiConstants.adminDataOffice, Method.post, data);

    if (res['status'] == 1) {
      EasyLoading.dismiss();

      final data = OfficeModel.fromJson(res['data']);

      pref.setString(PreferenceKey.office, jsonEncode(data.toJson()));

      return data;
    } else if (res['status'] == 0) {
      EasyLoading.dismiss();

      showToasts(text: res['message']);
      return null;
    } else {
      EasyLoading.dismiss();

      return null;
    }
  }
}
