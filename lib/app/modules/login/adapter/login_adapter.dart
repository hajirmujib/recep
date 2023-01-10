import 'package:mysleep/app/modules/profile/models/profile_model.dart';

abstract class ILoginRepository {
  Future<ProfileModel?> login({
    required String email,
    required String password,
    required String jabatan,
  });
}
