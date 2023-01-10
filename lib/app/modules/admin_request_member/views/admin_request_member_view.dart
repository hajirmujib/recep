import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';
import 'package:mysleep/app/widgets/photo_hero.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../controllers/admin_request_member_controller.dart';

class AdminRequestMemberView extends GetView<AdminRequestMemberController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Palette.black, //change your color here
        ),
        backgroundColor: Palette.white,
        centerTitle: false,
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text('Permintaan Daftar Anggota',
            style: FontBody.p17.copyWith(
              color: Palette.black,
            )),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        itemCount: controller.listReq.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, i) {
                          final data = controller.listReq[i];
                          return CardRequestAdmin(
                            memberModel: data,
                            controller: controller,
                          );
                        }),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ).marginSymmetric(horizontal: 20),
              ),
      ),
    );
  }
}

class CardRequestAdmin extends StatelessWidget {
  const CardRequestAdmin({
    Key? key,
    required this.memberModel,
    required this.controller,
  }) : super(key: key);
  final MemberModel memberModel;
  final AdminRequestMemberController controller;
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
              PhotoHero(
                  photo: memberModel.avatar ?? '', onTap: () {}, width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    memberModel.fullName ?? '',
                    style: FontBody.p15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    memberModel.nik ?? '',
                    style: FontBody.s12.copyWith(color: Palette.gray),
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Palette.gray,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  controller.acceptMember(id: memberModel.id!);
                },
                child: Container(
                  constraints: BoxConstraints(minWidth: 100),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.primary),
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Center(
                    child: Text(
                      "Terima",
                      style: FontBody.p15.copyWith(color: Palette.primary),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.rejectMember(id: memberModel.id!);
                },
                child: Container(
                  constraints: BoxConstraints(minWidth: 100),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.secondary),
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Center(
                    child: Text(
                      "Tolak",
                      style: FontBody.p15.copyWith(color: Palette.secondary),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
