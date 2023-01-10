import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysleep/app/helper/map_utils.dart';
import 'package:mysleep/app/modules/admin_setting/adapter/admin_setting_adapter.dart';
import 'package:mysleep/app/modules/register_company/adapter/regiser_company_adapter.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class AdminSettingController extends GetxController {
  final ISettingOfficeRepository iSettingOfficeRepository;
  final IRegCompanyRepository iRegCompanyRepository;
  AdminSettingController(
      {required this.iSettingOfficeRepository,
      required this.iRegCompanyRepository});
  final nameTxt = TextEditingController();
  final addresTxt = TextEditingController();
  final rangeTxt = TextEditingController();
  final kodeRefTxt = TextEditingController();
  final startWork = {};
  GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: "edit");

  final isAddresValid = true.obs;
  final isNameValid = true.obs;
  final isRangeValid = true.obs;
  final isReferalValid = true.obs;

  final addressByPositioned = ''.obs;
  final latLong = LatLng(0, 0).obs;

  final isLoading = false.obs;
  final day1 = {'label': 'Senin', 'value': 'Senin'}.obs;
  final day2 = {'label': 'Sabtu', 'value': 'Sabtu'}.obs;

  final time1 = DateTime(DateTime.now().year, 0, 0, 09, 00).obs;
  final time2 = DateTime(DateTime.now().year, 0, 0, 18, 0).obs;

  List dropdownItemList = [
    {'label': 'Senin', 'value': 'Senin'}, // label is required and unique
    {'label': 'Selasa', 'value': 'Selasa'},
    {'label': 'Rabu', 'value': 'Rabu'},
    {'label': 'Kamis', 'value': 'Kamis'},
    {'label': "Jum'at", 'value': "Jum'at"},
    {'label': 'Sabtu', 'value': 'Sabtu'},
    {'label': 'Minggu', 'value': 'Minggu'},
  ];
  Future<void> getDataOffice() async {
    isLoading(true);
    await iSettingOfficeRepository.getOffice().then((value) {
      if (value != null) {
        latLong.value = LatLng(double.parse(value.unitLatitude ?? '0'),
            (double.parse(value.unitLongiitude ?? '0')));
        getNameLocation();
        nameTxt.text = value.unitNama ?? '';
        addresTxt.text = value.unitAlamat ?? '';
        rangeTxt.text = value.unitJangkauan ?? '';
        kodeRefTxt.text = value.unitKodeReferal ?? '';
        isLoading(false);
      }
      isLoading(false);
    });
  }

  Future<void> edit() async {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      await iRegCompanyRepository
          .registerCompany(
              nama: nameTxt.text,
              alamat: addresTxt.text,
              jangkauan: rangeTxt.text,
              latitude: latLong.value.latitude.toString(),
              longitude: latLong.value.longitude.toString())
          .then((value) {
        if (value != null) {
          showToasts(text: 'Berhasil ubah data');

          getDataOffice();
        }
      });
      // Get.offAllNamed(Routes.BOTTOM_BAR);
    }
  }

  Future<void> getLocation() async {
    EasyLoading.show(status: 'Mencari lokasi anda..');
    final position = await MapUtils().determinePosition().catchError((error) {
      // errorMessage = error;
      log('ERROR : ${error}');
      EasyLoading.dismiss();
      showToasts(text: 'Gagal mendapatkan lokasi anda');
      // isError = true;
    });
    EasyLoading.dismiss();

    latLong.value = LatLng(position.latitude, position.longitude);
    getNameLocation();
    log('CURRENT LOCATION : ${latLong}');
  }

  Future<void> getNameLocation() async {
    EasyLoading.show(status: 'Mencari lokasi anda..');

    final position = await MapUtils()
        .getAddressFromLatLong(latLong.value)
        .catchError((error) {
      // errorMessage = error;
      log('ERROR : ${error}');
      EasyLoading.dismiss();
      showToasts(text: 'Gagal mendapatkan lokasi anda');
      // isError = true;
    });
    EasyLoading.dismiss();
    addressByPositioned.value = position;
  }

  @override
  void onInit() {
    getDataOffice();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  @override
  void dispose() {
    nameTxt.dispose();
    addresTxt.dispose();
    rangeTxt.dispose();
    super.dispose();
  }
}
