import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets_path.dart';
import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../widgets/button_global.dart';
import '../../edit_profile/views/edit_profile_view.dart';
import '../controllers/admin_add_member_controller.dart';

class AdminAddMemberView extends GetView<AdminAddMemberController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        title: Text(
          'Tambah Anggota',
          style: FontBody.p17.copyWith(color: Palette.black),
        ),
        iconTheme: IconThemeData(
          color: Palette.black, //change your color here
        ),
        backgroundColor: Palette.white,
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Center(
                child: Obx(
                  () => Stack(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(right: 20),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Palette.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller.filePath.value.isEmpty
                                ? AssetImage(AssetName.imgBatman)
                                : FileImage(File(controller.filePath.value))
                                    as ImageProvider,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: InkWell(
                          onTap: () => controller.getImage(true),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Palette.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Palette.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CoupleInput(
                validator: (val) {},
                controller: controller,
                title: "Nama",
                hintText: "Masukan Nama Anda",
                textEditingController: controller.nameTxt,
                suffix: SizedBox(),
              ),
              CoupleInput(
                validator: (val) {},
                controller: controller,
                title: "Nik",
                isNumber: true,
                hintText: "Masukan Nomor NIK Anda",
                textEditingController: controller.nikTxt,
                suffix: SizedBox(),
              ),
              CoupleInput(
                validator: (val) {},
                controller: controller,
                title: "Email",
                isNumber: false,
                hintText: "Masukan Email Anda",
                textEditingController: controller.emaliTxt,
                suffix: SizedBox(),
              ),
              Obx(
                () => CoupleInput(
                  validator: (val) {
                    // controller.changeEmail();
                    if (val!.isEmpty) {
                      controller.isPassValid(false);

                      return "Please insert password";
                    } else {
                      controller.isPassValid(true);
                      return null;
                    }
                  },
                  controller: controller,
                  title: "Password",
                  hintText: "Masukan Password Anda",
                  textEditingController: controller.passTxt,
                  obscure: controller.showPass.value,
                  suffix: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: IconButton(
                      onPressed: () {
                        controller.changeShowPass();
                      },
                      icon: Icon(
                        !controller.showPass.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 24,
                        color: Palette.gray,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: Get.width,
                height: 55,
                child: ButtonGlobal(
                    primary: Palette.black,
                    onTap: () {
                      controller.save();
                    },
                    child: Text(
                      "Simpan",
                      style: FontBody.p15.copyWith(color: Palette.white),
                    )),
              ).marginOnly(bottom: 50),
            ],
          ).marginSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
