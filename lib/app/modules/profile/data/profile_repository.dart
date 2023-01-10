import 'dart:developer';

import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/core/provider/preferences/preferences_manager.dart';
import 'package:mysleep/app/modules/profile/adapter/profile_adapter.dart';
import 'package:mysleep/app/modules/profile/models/profile_model.dart';

class ProfileRepository implements IProfileRepository {
  final SharedPreferencesManager sharedPreferencesManager;
  ProfileRepository({required this.sharedPreferencesManager});

  @override
  Future<bool> logOut() async {
    try {
      await sharedPreferencesManager.deleteAllPreferences();
      return true;
    } catch (e) {
      log('ERROR: $e');
    }
    return false;
  }

  @override
  Future<ProfileModel?> profile() async {
    final res =
        await RestClient().request(ApiConstants.profile, Method.get, {});
    if (res['status'] == 1) {
      log('${res["data"]}');
      final data = ProfileModel.fromJson(res['data']);
      return data;
    } else if (res['status'] == 0) {
      return null;
    }

    return null;
  }
}
