import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/core/api/services.dart';
import 'package:mysleep/app/modules/admin_add_member/adapter/add_member_adapter.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class AddMemberRepository implements IAddMemberRepository {
  @override
  Future<bool?> register(
      {required String name,
      required String email,
      required String nik,
      required String password,
      required File photo}) async {
    EasyLoading.show(status: 'Memuat...');

    final data = {
      'nama': name,
      'email': email,
      'nik': nik,
      'password': password,
      'avatar': await MultipartFile.fromFile(
        photo.path,
        filename: '${name + nik}.jpg',
      )
    };
    final res = await RestClient()
        .request(ApiConstants.adminAddMember, Method.post, data);
    EasyLoading.dismiss();

    if (res['status'] == 1) {
      showToasts(text: res['message']);

      return true;
    } else if (res['status'] == 0) {
      showToasts(text: res['message']);
      return false;
    } else {
      return false;
    }
  }
}
