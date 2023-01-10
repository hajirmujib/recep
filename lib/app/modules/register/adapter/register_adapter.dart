import 'dart:io';

import 'package:mysleep/app/modules/profile/models/profile_model.dart';

abstract class IRegiterRepository {
  Future<ProfileModel?> register(
      {required String name,
      required String email,
      required String nik,
      required String password,
      required String jabatan,
      required File photo});
}
