import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysleep/app/modules/register/adapter/register_adapter.dart';
import 'package:mysleep/app/routes/app_pages.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class RegisterController extends GetxController {
  final IRegiterRepository iRegiterRepository;
  RegisterController({required this.iRegiterRepository});
  final emailTxt = TextEditingController();
  final pasTxt = TextEditingController();
  final nikTxt = TextEditingController();
  final nameTxt = TextEditingController();

  final role = "".obs;

  final listRole = [
    {"id": "2", "name": "Admin"},
    {"id": "3", "name": "Anggota"}
  ];

  GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: "register");

  final isEmailValid = true.obs;
  final isNameValid = true.obs;
  final isPassValid = true.obs;
  final isNikValid = true.obs;
  final isPassLength = false.obs;
  final isPassNumber = false.obs;
  final showPass = false.obs;

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

  changeShowPass() {
    showPass.value = !showPass.value;
  }

  void register() async {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      final res = await iRegiterRepository.register(
          name: nameTxt.text,
          email: emailTxt.text,
          nik: nikTxt.text,
          password: pasTxt.text,
          jabatan: role.value,
          photo: fileController);
      if (res != null) {
        showToasts(text: 'Anda berhasil mendaftar');

        if (role.value == "2") {
          Get.offAllNamed(Routes.REGISTER_COMPANY);
        } else {
          Get.offAllNamed(Routes.BOTTOM_BAR);
        }
      }
    } else {
      showToasts(text: "Harap Lengkapi Data");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    nameTxt.dispose();
    emailTxt.dispose();
    pasTxt.dispose();
    nikTxt.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
