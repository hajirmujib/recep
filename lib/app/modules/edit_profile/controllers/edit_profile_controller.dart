import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:mysleep/app/modules/edit_profile/adapter/edit_profile_adapter.dart';
import 'package:mysleep/app/modules/home/controllers/home_controller.dart';
import 'package:mysleep/app/modules/profile/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  final IEditProfileRepository iEditProfileRepository;
  EditProfileController({required this.iEditProfileRepository});
  final homeController = Get.find<HomeController>();
  final user = ProfileModel().obs;

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
  getProfile() async {
    final pref = await SharedPreferences.getInstance();

    final getUser = pref.getString(PreferenceKey.user);
    if (getUser != null) {
      user.value = ProfileModel.fromJson(jsonDecode(getUser));
      nameTxt.text = user.value.fullName ?? '';
      nikTxt.text = user.value.nik ?? "";
      emaliTxt.text = user.value.email ?? "";
    }
  }

  // setProfile({required MemberModel profileModel}) {
  //   user.value = ProfileModel.fromJson(jsonDecode(profileModel));
  //   nameTxt.text = user.value.fullName ?? '';
  //   nikTxt.text = user.value.nik ?? "";
  //   emaliTxt.text = user.value.email ?? "";
  // }

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

  Future<void> editProfile() async {
    var formKey = key.currentState;
    if (formKey!.validate()) {
      print("validate");
      iEditProfileRepository
          .editProfile(
              name: nameTxt.text,
              email: emaliTxt.text,
              nik: nikTxt.text,
              password: passTxt.text,
              photo: fileController)
          .then((value) {
        if (value != null) {
          // setProfile();
          getProfile();
          homeController.onInit();
        }
      });
    }
  }

  @override
  void onInit() {
    final arg = Get.arguments;
    // setProfile(profileModel: arg[]);
    getProfile();
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
