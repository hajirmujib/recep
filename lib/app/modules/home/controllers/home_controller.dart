import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/helper/map_utils.dart';
import 'package:mysleep/app/modules/home/adapter/attendance_adapter.dart';
import 'package:mysleep/app/modules/home/models/dashboard_model.dart';
import 'package:mysleep/app/modules/home/views/components/alert_cant_absen.dart';
import 'package:mysleep/app/modules/profile/adapter/profile_adapter.dart';
import 'package:mysleep/app/modules/profile/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/provider/preferences/preferences_manager.dart';

class HomeController extends GetxController {
  final SharedPreferencesManager sharedPreferencesManager;
  final IAttendanceRepository iAttendanceRepository;
  final IProfileRepository iProfileRepository;

  HomeController(
      {required this.sharedPreferencesManager,
      required this.iAttendanceRepository,
      required this.iProfileRepository});

  DateTime now = DateTime.now();
  // DateTime? formatedDate;
  // final clock = ''.obs;
  final role = "".obs;
  final user = ProfileModel().obs;
  final kodeTxt = TextEditingController();
  final isFoundCode = false.obs;
  final isCheckin = false.obs;
  final isLoading = false.obs;
  final latLong = LatLng(0, 0).obs;
  final dataDashboard = DashboardModel().obs;

  ///File picker
  File fileController = File('');
  final filePath = ''.obs;
  final picker = ImagePicker();

  void removeImage() {
    fileController = File('');
    filePath.value = '';
  }

  Future getImage(bool isFromGallery) async {
    final pickedFile = await picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 20);
    if (pickedFile != null) {
      fileController = File(pickedFile.path);
      filePath.value = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }

  String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat("H:m").format(now);
  }

  void check() async {
    isLoading(true);
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    log('$formattedDate');
    Future.delayed(Duration(seconds: 1), () {
      // failed();
      // showToasts(title: 'Selamat!!', text: "Anda Berhasil Absen");
      getLocation().then((value) {
        log('VALUE GET LOCATION : $value');
        if (value == true) {
          // getImage(false);
          iAttendanceRepository
              .attendanceIn(
                  latitude: latLong.value.latitude.toString(),
                  longitude: latLong.value.longitude.toString(),
                  tglMasuk: formattedDate)
              .then((value) {
            isLoading(false);
          });
        }
      });
    });
  }

  void failed() {
    Get.bottomSheet(
      alertCantAbsen(),
    );
  }

  Future<bool> getLocation() async {
    var value = true;
    final position = await MapUtils().determinePosition().catchError((error) {
      // errorMessage = error;
      log('ERROR : ${error}');

      failed();
      value = false;
    });

    latLong.value = LatLng(position.latitude, position.longitude);
    return value;
  }

  ///Admin
  Stream<dynamic> streamDashboardAmin() async* {
    yield* Stream.periodic(Duration(seconds: 1), (_) async {
      var res = await iAttendanceRepository.dashboard();
      if (res != null) {
        if (res != dataDashboard.value) {
          dataDashboard.value = res;
        }
      }
    }).asyncMap(
      (event) async {
        return await event;
      },
    );
  }

  ///send kode referal
  void sendKode() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await iAttendanceRepository.sendKode(kodeRef: kodeTxt.text).then((value) {
      if (value == true) {
        kodeTxt.clear();
        getUser();
      }
    });
  }

  getUser() async {
    final pref = await SharedPreferences.getInstance();

    await iProfileRepository.profile().then((value) {
      if (value != null) {
        user.value = value;
        pref.setString(PreferenceKey.user, jsonEncode(value.toJson()));
      }
    });
  }

  @override
  void onInit() async {
    // formatedDate = now.subtract(Duration(
    //   hours: now.hour,
    //   minutes: now.minute,
    // ));

    final pref = await SharedPreferences.getInstance();
    role.value = pref.getString(PreferenceKey.role) ?? "";
    log('ROLE ${role.value}');
    final prefUser = pref.getString(PreferenceKey.user);
    if (prefUser != null) {
      getUser();

      log('TOKEN : ${user.value.token}');
      if (user.value.kodeReferal != "0" || user.value.kodeReferal != null) {
        log('KODE REFERAL : ${user.value.kodeReferal}');

        isFoundCode(true);
      } else {
        isFoundCode(false);
      }
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
