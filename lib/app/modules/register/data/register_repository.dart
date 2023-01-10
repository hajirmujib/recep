import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/profile/models/profile_model.dart';
import 'package:mysleep/app/modules/register/adapter/register_adapter.dart';
import 'package:mysleep/app/widgets/show_tost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepository implements IRegiterRepository {
  @override
  Future<ProfileModel?> register(
      {required String name,
      required String email,
      required String nik,
      required String password,
      required String jabatan,
      required File photo}) async {
    EasyLoading.show(status: 'Memuat...');
    final pref = await SharedPreferences.getInstance();
    final data = {
      'nama': name,
      'email': email,
      'nik': nik,
      'password': password,
      'jabatan': jabatan,
      'avatar': await MultipartFile.fromFile(
        photo.path,
        // filename: "bukti_tf" + idTransaksi + ".jpg",
        filename: '${name + nik}.jpg',
      )
    };
    final res =
        await RestClient().request(ApiConstants.register, Method.post, data);
    EasyLoading.dismiss();

    if (res['status'] == 1) {
      final data = ProfileModel.fromJson(res['data']);
      pref.setString(PreferenceKey.token, data.token ?? '');
      pref.setString(PreferenceKey.user, jsonEncode(data.toJson()));
      pref.setString(PreferenceKey.isLogin, '1');
      pref.setString(PreferenceKey.role, jabatan);

      return data;
    } else if (res['status'] == 0) {
      showToasts(text: res['message']);
      return null;
    } else {
      return null;
    }
  }
}
