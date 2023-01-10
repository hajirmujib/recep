import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_setting/views/components/data_company.dart';
import 'package:mysleep/app/modules/admin_setting/views/components/jam_kerja.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../controllers/admin_setting_controller.dart';

class AdminSettingView extends GetView<AdminSettingController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Palette.black, //change your color here
          ),
          backgroundColor: Palette.white,
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          title: Text('Pengaturan Kantor',
              style: FontBody.p17.copyWith(
                color: Palette.black,
              )),
          bottom: TabBar(
            labelStyle: FontBody.p15.copyWith(color: Palette.black),
            labelColor: Palette.black,
            unselectedLabelColor: Palette.gray,
            tabs: [
              Tab(
                text: 'Data Kantor',
              ),
              Tab(
                text: 'Waktu Kerja',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Form(
              key: controller.key,
              child: Obx(
                () => controller.isLoading.value
                    ? Container()
                    : SectionDataCompany(
                        controller: controller,
                      ).marginSymmetric(horizontal: 20),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Obx(
              () => controller.isLoading.value
                  ? Container()
                  : SectionJamKerja(
                      controller: controller,
                    ).marginSymmetric(horizontal: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
