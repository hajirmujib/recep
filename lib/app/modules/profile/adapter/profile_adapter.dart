import 'package:mysleep/app/modules/profile/models/profile_model.dart';

abstract class IProfileRepository {
  Future<bool> logOut();
  Future<ProfileModel?> profile();
}
