import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/constants/date_format_indo.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../../../widgets/button_global.dart';
import '../../../../widgets/input_field.dart';
import '../../controllers/home_controller.dart';

class SectionMember extends StatelessWidget {
  const SectionMember({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Obx(() => controller.isFoundCode.value == false
                ? Column(
                    children: [
                      SizedBox(
                        width: Get.width * 0.9,
                        child: InputField(
                            obscure: false,
                            isNumber: true,
                            suffix: SizedBox(),
                            controller: controller.kodeTxt,
                            hintText: "Masukan Kode Perusahaan Anda",
                            onChange: (val) {},
                            validator: (e) {}),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width * 0.9,
                        height: 55,
                        child: ButtonGlobal(
                            primary: Palette.black,
                            onTap: () {
                              controller.sendKode();
                              // controller.login();
                            },
                            child: Text(
                              "Simpan",
                              style:
                                  FontBody.p15.copyWith(color: Palette.white),
                            )),
                      ),
                    ],
                  )
                : InkWell(
                    radius: 50,
                    onTap: () {
                      controller.check();
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.isLoading.value
                                ? SpinKitFadingCircle(
                                    color: Colors.white,
                                    size: 50.0,
                                  )
                                : Image.asset(
                                    AssetName.iconButton,
                                    width: 50,
                                    color: Palette.white,
                                  ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                                controller.isLoading.value
                                    ? 'Mengecek'
                                    : controller.isCheckin.value
                                        ? 'Absen Masuk'
                                        : 'Absen Keluar',
                                style: FontBody.p15.copyWith(
                                  color: Palette.white,
                                )),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.isLoading.value
                            ? Palette.darkBlue
                            : controller.isCheckin.value
                                ? Palette.primary
                                : Palette.secondary,
                        boxShadow: [
                          BoxShadow(
                            color: Palette.gray.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  )),
            SizedBox(
              height: 50,
            ),
            Obx(() => Visibility(
                  visible: controller.isFoundCode.value == true ? true : false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            AssetName.iconArrowLeft,
                            width: 30,
                            height: 30,
                            color: Palette.primary.withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '07.58',
                            style: FontBody.p15.copyWith(
                              color: Palette.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            AssetName.iconArrowRight,
                            width: 30,
                            height: 30,
                            color: Palette.secondary.withOpacity(0.7),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '--.--',
                            style: FontBody.p15.copyWith(
                              color: Palette.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
