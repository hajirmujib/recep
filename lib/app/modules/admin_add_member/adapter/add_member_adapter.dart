import 'dart:io';

import 'package:mysleep/app/modules/profile/models/profile_model.dart';

abstract class IAddMemberRepository {
  Future<bool?> register(
      {required String name,
      required String email,
      required String nik,
      required String password,
      required File photo});
}
