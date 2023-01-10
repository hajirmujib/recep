import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../widgets/button_global.dart';
import '../../../widgets/input_field.dart';
import '../controllers/register_company_controller.dart';

class RegisterCompanyView extends GetView<RegisterCompanyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Form(
            key: controller.key,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Text(
                  "Data Perusahaan",
                  style: FontHeader.h22.copyWith(color: Palette.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Silahkan Isi Form Dengan Lengkap",
                  style: FontBody.p15.copyWith(color: Palette.gray),
                ),
                SizedBox(
                  height: 40,
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
                InkWell(
                  onTap: () {
                    controller.getLocation();
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        AssetName.iconPin,
                        width: 22,
                        height: 22,
                        color: Palette.secondary,
                      ).marginOnly(right: 10),
                      Obx(() => Text(
                            controller.addressByPositioned.value == ""
                                ? "Pilih Lokasi"
                                : "Ganti Lokasi",
                            style:
                                FontBody.p15.copyWith(color: Palette.primary),
                          )),
                      Text(
                        ' (* mengambil lokasi terkini)',
                        style: FontBody.p15
                            .copyWith(color: Palette.black, fontSize: 11),
                      )
                    ],
                  ),
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
                      controller.register();
                    },
                    child: Text(
                      "Daftar",
                      style: FontHeader.h15.copyWith(color: Palette.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ).marginSymmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
