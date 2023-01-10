import 'package:mysleep/app/modules/home/models/dashboard_model.dart';

abstract class IAttendanceRepository {
  Future<bool> attendanceIn(
      {required String tglMasuk,
      required String latitude,
      required String longitude});

  Future<bool> attendanceOut({
    required String tglKeluar,
  });
  Future<DashboardModel?> dashboard();
  Future<bool?> sendKode({required String kodeRef});
}
