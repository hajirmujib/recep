import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysleep/app/modules/admin_add_member/adapter/add_member_adapter.dart';
import 'package:mysleep/app/modules/admin_member/controllers/admin_member_controller.dart';
import 'package:mysleep/app/widgets/show_tost.dart';

class AdminAddMemberController extends GetxController {
  final IAddMemberRepository iAddMemberRepository;
  AdminAddMemberController({required this.iAddMemberRepository});

  final adminMemberController = Get.find<AdminMemberController>();
  File fileController = File('');
  final filePath = ''.obs;
  final picker = ImagePicker();

  final nameTxt = TextEditingController();
  final emaliTxt = TextEditingController();
  final nikTxt = TextEditingController();
  final passTxt = TextEditingController();

  final isPassValid = true.obs;
  final showPass = true.obs;

  final key = GlobalKey<FormState>();

  changeShowPass() {
    showPass.value = !showPass.value;
  }

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

  void save() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      final res = await iAddMemberRepository.register(
          name: nameTxt.text,
          email: emaliTxt.text,
          nik: nikTxt.text,
          password: passTxt.text,
          photo: fileController);
      if (res != null) {
        emaliTxt.clear();
        emaliTxt.clear();
        nikTxt.clear();
        passTxt.clear();
        fileController = File('');
        filePath.value = '';
        adminMemberController.getListReq();
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
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    nameTxt.dispose();
    nikTxt.dispose();
    emaliTxt.dispose();
    passTxt.dispose();
    super.dispose();
  }

  @override
  void onClose() {}
}
