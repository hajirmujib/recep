import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';
import 'package:mysleep/app/modules/admin_setting/controllers/admin_setting_controller.dart';
import 'package:mysleep/app/widgets/button_global.dart';
import 'package:mysleep/app/widgets/input_field.dart';


class SectionDataCompany extends StatelessWidget {
  const SectionDataCompany({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AdminSettingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Obx(
          () => SizedBox(
            height: controller.isNameValid.value ? 56 : 79,
            width: Get.width * 0.9,
            child: InputField(
                isNumber: false,
                onChange: (v) {},
                controller: controller.nameTxt,
                hintText: "Nama Perusahaan",
                validator: (val) {
                  // controller.changeEmail();
                  if (val!.isEmpty) {
                    controller.isNameValid(false);

                    return "Please insert Name";
                  } else {
                    controller.isNameValid(true);
                  }
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Obx(
          () => SizedBox(
            height: controller.isAddresValid.value ? 56 : 79,
            width: Get.width * 0.9,
            child: InputField(
                onChange: (v) {},
                controller: controller.addresTxt,
                hintText: "Alamat",
                validator: (val) {
                  // controller.changeEmail();
                  if (val!.isEmpty) {
                    controller.isAddresValid(false);

                    return "Please insert addres";
                  } else {
                    controller.isAddresValid(false);
                  }
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Obx(
          () => SizedBox(
            height: controller.isRangeValid.value ? 56 : 79,
            width: Get.width * 0.9,
            child: InputField(
                isNumber: true,
                onChange: (v) {},
                controller: controller.rangeTxt,
                hintText: "Jangkauan Absen (/Meter)",
                validator: (val) {
                  // controller.changeEmail();
                  if (val!.isEmpty) {
                    controller.isRangeValid(false);

                    return "Please insert Range";
                  } else {
                    controller.isRangeValid(true);
                  }
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Obx(
          () => SizedBox(
            height: controller.isRangeValid.value ? 56 : 79,
            width: Get.width * 0.9,
            child: InputField(
                enable: false,
                isNumber: true,
                onChange: (v) {},
                controller: controller.kodeRefTxt,
                hintText: "Kode Referal",
                validator: (val) {
                  // controller.changeEmail();
                  if (val!.isEmpty) {
                    controller.isReferalValid(false);

                    return "Please insert kode referal";
                  } else {
                    controller.isReferalValid(true);
                  }
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Image.asset(
              AssetName.iconPin,
              width: 22,
              height: 22,
              color: Palette.secondary,
            ).marginOnly(right: 10),
            Obx(() => InkWell(
                  onTap: () {
                    controller.getLocation();
                  },
                  child: Text(
                    controller.addressByPositioned.value == ""
                        ? "Pilih Lokasi"
                        : "Ganti Lokasi",
                    style: FontBody.p15.copyWith(color: Palette.primary),
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Obx(() => Text(
                controller.addressByPositioned.value,
                style: FontBody.s12.copyWith(color: Palette.black),
              )),
        ),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          width: Get.width,
          child: ButtonGlobal(
            primary: Palette.black,
            onTap: () {
              controller.edit();
            },
            child: Text(
              "Simpan",
              style: FontHeader.h15.copyWith(color: Palette.white),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
