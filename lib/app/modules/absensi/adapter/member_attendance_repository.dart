import 'package:mysleep/app/modules/absensi/models/absensi_model.dart';

abstract class IMemberAbsensiRepo {
  Future<AbsensiModel?> getAbsensi({required String date});
}
