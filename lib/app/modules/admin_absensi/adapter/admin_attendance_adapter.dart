import 'package:mysleep/app/modules/admin_absensi/models/admin_absensi_model.dart';

abstract class IAdminAbsensiRepo {
  // Future<List<AdminAbsensiModel>?> getAbsensi({required String date});
  Future<List<AdminAbsensiModel>?> getListAbsensi();
}
