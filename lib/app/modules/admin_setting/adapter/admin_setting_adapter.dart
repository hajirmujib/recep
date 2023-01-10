import 'package:mysleep/app/modules/register_company/models/company_model.dart';

abstract class ISettingOfficeRepository {
  Future<OfficeModel?> getOffice();
}
