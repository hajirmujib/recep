import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/modules/admin_absensi/models/admin_absensi_model.dart';
import 'package:mysleep/app/widgets/photo_hero.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../controllers/admin_absensi_controller.dart';

class AdminAbsensiView extends GetView<AdminAbsensiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.darkBlue,
        onPressed: () {
          // controller.changeShow();
          Get.defaultDialog(
            title: "",
            contentPadding: EdgeInsets.zero,
            content: SectionCalendar(
              controller: controller,
            ),
          );
        },
        child: Image.asset(
          AssetName.iconCalendar,
          width: 15,
          height: 15,
          color: Palette.white,
        ),
      ).marginOnly(bottom: 20),
      appBar: AppBar(
        backgroundColor: Palette.white,
        centerTitle: false,
        elevation: 0.0,
        title: Text('Riwayat Absen',
            style: FontBody.p17.copyWith(
              color: Palette.black,
            )),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => controller.isLoading.value
            ? Container()
            : Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      itemCount: controller.listAbsensi.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        final data = controller.listAbsensi[i];
                        return CardAbsensiAdmin(
                          data: data,
                        );
                      }),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ).marginSymmetric(horizontal: 20),
      )),
    );
  }
}

class CardAbsensiAdmin extends StatelessWidget {
  const CardAbsensiAdmin({
    Key? key,
    required this.data,
  }) : super(key: key);
  final AdminAbsensiModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: Get.width,
      // height: 100,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Palette.white,
        boxShadow: Palette.listShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Container(
              //   margin: EdgeInsets.only(right: 20),
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     border: Border.all(color: Palette.black),
              //     image: DecorationImage(
              //       image: AssetImage(AssetName.imgBatman),
              //     ),
              //   ),
              // ),
              PhotoHero(photo: data.avatar ?? '', onTap: () {}, width: 50)
                  .marginOnly(right: 10),
              Text(
                data.nama ?? '',
                style: FontBody.p15,
              )
            ],
          ),
          Divider(
            color: Palette.gray,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Masuk",
                    style: FontBody.p15,
                  ),
                  Text(
                    data.masuk ?? '--.--',
                    style: FontBody.s12,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Keluar",
                    style: FontBody.p15,
                  ),
                  Text(
                    data.keluar ?? '--.--',
                    style: FontBody.s12,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SectionCalendar extends StatelessWidget {
  const SectionCalendar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AdminAbsensiController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Palette.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Palette.gray.withOpacity(0.3),
          //     spreadRadius: 2,
          //     blurRadius: 9,
          //     offset: Offset(0, 5), // changes position of shadow
          //   ),
          // ],
          borderRadius: BorderRadius.circular(26)),
      height: Get.height * 0.45,
      width: Get.width,
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            dayTextStyle: FontBody.p15.copyWith(color: Palette.black),
            yearTextStyle: FontBody.p17),
        onValueChanged: (dates) {
          // controller.changeShow();

          print(dates[0]);
        },
        initialValue: [],
      ),
    );
  }
}
