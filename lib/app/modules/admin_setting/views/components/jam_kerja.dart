import 'dart:developer';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/date_format_with_zero.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';
import 'package:mysleep/app/modules/admin_setting/controllers/admin_setting_controller.dart';
import 'package:mysleep/app/widgets/button_global.dart';

class SectionJamKerja extends StatelessWidget {
  const SectionJamKerja({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: Get.width * 0.4,
                height: 100,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hari Mulai",
                      style: FontBody.p15.copyWith(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    containerDropdown(
                        listDay: controller.dropdownItemList,
                        value: controller.day1),
                  ],
                )),
            Container(
                width: Get.width * 0.4,
                height: 100,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hari Selesai",
                      style: FontBody.p15.copyWith(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    containerDropdown(
                        listDay: controller.dropdownItemList,
                        value: controller.day2),
                  ],
                )),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: Get.width * 0.4,
                height: 100,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jam Mulai",
                      style: FontBody.p15.copyWith(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showTimePicker(context,
                            currentTime: controller.time1.value,
                            onConfirm: (val) {
                          log('DATE TIME : ${val.hour}:${val.minute}');
                          controller.time1.value = val;
                        });
                      },
                      child: containerTime(time: controller.time1.value),
                    ),
                  ],
                )),
            Container(
                width: Get.width * 0.4,
                height: 100,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jam Selesai",
                      style: FontBody.p15.copyWith(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showTimePicker(context,
                            currentTime: controller.time2.value,
                            onConfirm: (val) {
                          log('DATE TIME : ${val.hour}:${val.minute}');
                          controller.time2.value = val;
                        });
                      },
                      child: containerTime(time: controller.time2.value),
                    ),
                  ],
                )),
          ],
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

  Widget containerTime({required DateTime time}) {
    return Container(
      width: Get.width * 0.4,
      height: 50,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Palette.gray),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${dateFormatWithZero(time)} ',
          style: FontBody.p15.copyWith(fontSize: 14),
        ),
      ),
    );
  }

  Widget containerDropdown(
      {required List<dynamic> listDay, required dynamic value}) {
    return CoolDropdown(
      dropdownWidth: Get.width * 0.3,
      selectedItemBD: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Palette.primary.withOpacity(0.5),
      ),
      unselectedItemTS:
          FontHeader.h15.copyWith(fontSize: 14, color: Palette.black),
      selectedItemTS:
          FontHeader.h15.copyWith(fontSize: 14, color: Colors.white),
      placeholderTS:
          FontHeader.h15.copyWith(fontSize: 14, color: Palette.black),
      resultTS: FontHeader.h15.copyWith(fontSize: 14, color: Palette.black),
      dropdownBD: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Palette.gray),
      ),
      resultBD: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Palette.gray),
      ),
      dropdownList: listDay,
      onChange: (val) {
        value.value = val;
        log('VALUE : ${val["value"]}');
      },
      defaultValue: value,
      placeholder: 'Hari Selesai',
    );
  }
}
