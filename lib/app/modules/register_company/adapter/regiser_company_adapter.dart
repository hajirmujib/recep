import 'package:mysleep/app/modules/register_company/models/company_model.dart';

abstract class IRegCompanyRepository {
  Future<OfficeModel?> registerCompany({
    required String nama,
    required String alamat,
    required String jangkauan,
    required String latitude,
    required String longitude,
  });
}
