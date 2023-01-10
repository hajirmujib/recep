import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mysleep/app/modules/absensi/adapter/member_attendance_repository.dart';
import 'package:mysleep/app/modules/absensi/models/absensi_model.dart';

class AbsensiController extends GetxController {
  final IMemberAbsensiRepo iMemberAbsensiRepo;
  AbsensiController({required this.iMemberAbsensiRepo});
  final absensiData = AbsensiModel().obs;
  final now = DateTime.now().obs;

  getAbsensi() async {
    absensiData.value = await iMemberAbsensiRepo.getAbsensi(
            date: DateFormat('yyyy-MM-dd').format(now.value)) ??
        AbsensiModel();
  }

  @override
  void onInit() {
    now.value = DateTime.now();
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
