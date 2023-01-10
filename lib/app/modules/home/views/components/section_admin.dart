import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/date_format_indo.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../controllers/home_controller.dart';

class SectionAdmin extends StatelessWidget {
  const SectionAdmin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 50,
          // ),
          TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
            return Text("${controller.getSystemTime()}",
                style: FontBody.p34.copyWith(
                  color: Palette.black,
                ));
          }),
          Text(dateFormatter(controller.now),
              style: FontBody.p17.copyWith(
                color: Palette.black,
              )),
          SizedBox(
            height: 50,
          ),
          StreamBuilder<dynamic>(
              stream: controller.streamDashboardAmin(),
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                            '${controller.dataDashboard.value.jumlahAnggotaPresensi ?? '-'}/${controller.dataDashboard.value.jumlahAnggota ?? "-"}',
                            style: FontHeader.h37.copyWith(
                              color: Palette.white,
                            ))),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Jumlah Absen',
                            style: FontBody.p15.copyWith(
                              color: Palette.white,
                            )),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Palette.darkBlue,
                    boxShadow: [
                      BoxShadow(
                        color: Palette.gray.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
