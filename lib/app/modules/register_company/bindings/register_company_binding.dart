import 'package:get/get.dart';
import 'package:mysleep/app/modules/register_company/adapter/regiser_company_adapter.dart';
import 'package:mysleep/app/modules/register_company/data/reg_company_repository.dart';

import '../controllers/register_company_controller.dart';

class RegisterCompanyBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<IRegCompanyRepository>(
      () => RegCompanyRepository(),
    );
    Get.lazyPut<RegisterCompanyController>(
      () => RegisterCompanyController(iRegCompanyRepository: Get.find()),
    );
  }
}
