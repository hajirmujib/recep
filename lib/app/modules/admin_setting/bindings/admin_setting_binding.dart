import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_setting/adapter/admin_setting_adapter.dart';
import 'package:mysleep/app/modules/admin_setting/data/setting_office_repository.dart';
import 'package:mysleep/app/modules/register_company/adapter/regiser_company_adapter.dart';
import 'package:mysleep/app/modules/register_company/data/reg_company_repository.dart';

import '../controllers/admin_setting_controller.dart';

class AdminSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISettingOfficeRepository>(
      () => OfficSettingRepository(),
    );
    Get.lazyPut<IRegCompanyRepository>(
      () => RegCompanyRepository(),
    );
    Get.lazyPut<AdminSettingController>(
      () => AdminSettingController(
          iSettingOfficeRepository: Get.find(),
          iRegCompanyRepository: Get.find<IRegCompanyRepository>()),
    );
  }
}
