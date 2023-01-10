import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/pallete.dart';

import '../../../constants/fonts.dart';
import '../controllers/absensi_controller.dart';

class AbsensiView extends GetView<AbsensiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        centerTitle: false,
        elevation: 0.0,
        title: Text('Riwayat Absen',
            style: FontBody.p17.copyWith(
              color: Palette.black,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Palette.white,
                boxShadow: [
                  BoxShadow(
                    color: Palette.gray.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 9,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(26)),
            height: Get.height * 0.40,
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  dayTextStyle: FontBody.p15.copyWith(color: Palette.black),
                  yearTextStyle: FontBody.p17),
              onValueChanged: (dates) {
                print(dates[0]);
                controller.now.value = dates[0]!;
                controller.getAbsensi();
              },
              initialValue: [],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                width: Get.width * 0.4,
                height: Get.width * 0.45,
                decoration: BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  children: [
                    Text('Absen Masuk',
                        style: FontBody.p17.copyWith(
                          color: Palette.white,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Obx(() => Text(
                        controller.absensiData.value.pegPresensiMasuk ??
                            '--.--',
                        style: FontHeader.h37.copyWith(
                          color: Palette.white,
                        ))),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                width: Get.width * 0.4,
                height: Get.width * 0.45,
                decoration: BoxDecoration(
                  color: Palette.secondary,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  children: [
                    Text('Absen Keluar',
                        style: FontBody.p17.copyWith(
                          color: Palette.white,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Obx(() => Text(
                        controller.absensiData.value.pegPresensiMasuk ??
                            '--.--',
                        style: FontHeader.h37.copyWith(
                          color: Palette.white,
                        ))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).marginSymmetric(horizontal: 20),
    );
  }
}
