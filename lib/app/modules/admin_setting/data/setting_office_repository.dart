import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/admin_setting/adapter/admin_setting_adapter.dart';
import 'package:mysleep/app/modules/register_company/models/company_model.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class OfficSettingRepository implements ISettingOfficeRepository {
  @override
  Future<OfficeModel?> getOffice() async {
    EasyLoading.show(status: 'Memuat...');
    final res = await RestClient()
        .request(ApiConstants.adminGetDataOffice, Method.get, {});

    if (res['status'] == 1) {
      EasyLoading.dismiss();
      final data = OfficeModel.fromJson(res['data']);
      return data;
    } else {
      EasyLoading.dismiss();

      showToasts(text: res['message']);
      return null;
    }
  }
}
