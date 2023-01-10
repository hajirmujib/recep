import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysleep/app/helper/map_utils.dart';
import 'package:mysleep/app/modules/register_company/adapter/regiser_company_adapter.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

import '../../../routes/app_pages.dart';

class RegisterCompanyController extends GetxController {
  final IRegCompanyRepository iRegCompanyRepository;
  RegisterCompanyController({required this.iRegCompanyRepository});
  final nameTxt = TextEditingController();
  final addresTxt = TextEditingController();
  final rangeTxt = TextEditingController();
  final addressByPositioned = ''.obs;

  GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: "register");

  final isAddresValid = true.obs;
  final isNameValid = true.obs;
  final isRangeValid = true.obs;

  // final addres = "Jl. Wiratama No.44".obs;
  final latLong = LatLng(0, 0).obs;

  Future<void> register() async {
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
          Get.offAllNamed(Routes.BOTTOM_BAR);
        }
      });
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
  void onInit() async {
    await getLocation();
    super.onInit();
  }

  @override
  void dispose() {
    nameTxt.dispose();
    addresTxt.dispose();
    rangeTxt.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
