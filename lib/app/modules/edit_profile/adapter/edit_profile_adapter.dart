import 'dart:io';

import 'package:mysleep/app/modules/profile/models/profile_model.dart';

abstract class IEditProfileRepository {
  Future<ProfileModel?> editProfile(
      {required String name,
      required String email,
      required String nik,
      required String password,
      required File photo});
}
