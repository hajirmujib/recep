import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_absensi/adapter/admin_attendance_adapter.dart';
import 'package:mysleep/app/modules/admin_absensi/models/admin_absensi_model.dart';

class AdminAbsensiController extends GetxController {
  final IAdminAbsensiRepo iAdminAbsensiRepo;
  AdminAbsensiController({required this.iAdminAbsensiRepo});
  final showCalendar = false.obs;
  final listAbsensi = <AdminAbsensiModel>[];
  final isLoading = false.obs;
  changeShow() {
    showCalendar.value = !showCalendar.value;
  }

  getAbsensi() async {
    isLoading(true);
    listAbsensi.assignAll(await iAdminAbsensiRepo.getListAbsensi() ?? []);
    isLoading(false);
  }

  @override
  void onInit() {
    getAbsensi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
