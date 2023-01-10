import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/edit_profile/adapter/edit_profile_adapter.dart';
import 'package:mysleep/app/modules/profile/models/profile_model.dart';
import 'package:mysleep/app/widgets/show_tost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileRepository implements IEditProfileRepository {
  @override
  Future<ProfileModel?> editProfile(
      {required String name,
      required String email,
      required String nik,
      required String password,
      required File photo}) async {
    EasyLoading.show();
    final pref = await SharedPreferences.getInstance();
    final data = {
      'nama': name,
      'email': email,
      'nik': nik,
      'password': password,
      'avatar': photo.path == ''
          ? ''
          : await MultipartFile.fromFile(
              photo.path,
              // filename: "bukti_tf" + idTransaksi + ".jpg",
              filename: '${name + nik}.jpg',
            )
    };

    final res = await RestClient()
        .request(ApiConstants.updateProfile, Method.post, data);
    print(res);
    if (res['status'] == 1) {
      EasyLoading.dismiss();

      final data = ProfileModel.fromJson(res['data']);
      pref.setString(PreferenceKey.user, jsonEncode(data.toJson()));

      return data;
    } else if (res['status'] == 0) {
      EasyLoading.dismiss();
      log('res1x');
      showToasts(text: res['message']);
      return null;
    } else {
      EasyLoading.dismiss();

      return null;
    }
  }
}
