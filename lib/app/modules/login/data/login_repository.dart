import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/login/adapter/login_adapter.dart';
import 'package:mysleep/app/modules/profile/models/profile_model.dart';
import 'package:mysleep/app/widgets/show_tost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository implements ILoginRepository {
  @override
  Future<ProfileModel?> login(
      {required String email,
      required String password,
      required String jabatan}) async {
    EasyLoading.show();
    final pref = await SharedPreferences.getInstance();

    final data = {
      "email": email,
      "password": password,
      "jabatan": jabatan,
    };
    final res =
        await RestClient().request(ApiConstants.auth, Method.post, data);
    EasyLoading.dismiss();
    if (res['status'] == 1) {
      final data = ProfileModel.fromJson(res['data']);
      pref.setString(PreferenceKey.token, data.token ?? '');
      pref.setString(PreferenceKey.user, jsonEncode(data.toJson()));
      pref.setString(PreferenceKey.isLogin, '1');
      pref.setString(PreferenceKey.role, jabatan);

      return data;
    } else {
      showToasts(text: res['message']);
      return null;
    }
  }
}
