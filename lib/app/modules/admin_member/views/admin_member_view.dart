import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/modules/admin_request_member/models/member_model.dart';
import 'package:mysleep/app/widgets/photo_hero.dart';

import '../../../constants/fonts.dart';
import '../../../constants/pallete.dart';
import '../../../routes/app_pages.dart';
import '../controllers/admin_member_controller.dart';

class AdminMemberView extends GetView<AdminMemberController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.white,
          centerTitle: false,
          elevation: 0.0,
          title: Text('Daftar Anggota',
              style: FontBody.p17.copyWith(
                color: Palette.black,
              )),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.ADMIN_REQUEST_MEMBER);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Palette.black),
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Center(
                  child: Text(
                    "Permintaan\nAnggota",
                    style: FontBody.s12.copyWith(color: Palette.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.ADMIN_ADD_MEMBER);
                },
                icon: Icon(
                  Icons.add,
                  color: Palette.black,
                  size: 30,
                )).marginOnly(right: 16)
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return controller.getListReq();
          },
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Obx(
                () => controller.isLoading.value
                    ? Container()
                    : Column(
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
                                return Slidable(
                                    // Specify a key if the Slidable is dismissible.
                                    key: ValueKey(i.toInt()),

                                    // The end action pane is the one at the right or the bottom side.
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          // An action can be bigger than the others.
                                          flex: 1,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            bottomRight: Radius.circular(16),
                                          ),
                                          onPressed: (c) {
                                            Get.toNamed(Routes.EDIT_PROFILE,
                                                arguments: [data]);
                                          },
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Palette.white,
                                          foregroundColor: Palette.darkBlue,
                                          icon: Icons.edit,
                                          label: 'Ubah',
                                        ),
                                        SlidableAction(
                                          // An action can be bigger than the others.
                                          flex: 1,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            bottomRight: Radius.circular(16),
                                          ),
                                          onPressed: (c) {
                                            Get.toNamed(Routes.EDIT_PROFILE);
                                          },
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Palette.white,
                                          foregroundColor: Palette.secondary,
                                          icon: Icons.delete,
                                          label: 'Hapus',
                                        ),
                                      ],
                                    ),
                                    child: CardMemberAdmin(
                                      memberModel: data,
                                      controller: controller,
                                    ));
                              }),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ).marginSymmetric(horizontal: 20),
              )),
        ));
  }
}

class CardMemberAdmin extends StatelessWidget {
  const CardMemberAdmin({
    Key? key,
    required this.memberModel,
    required this.controller,
  }) : super(key: key);
  final MemberModel memberModel;
  final AdminMemberController controller;
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
              //   width: 65,
              //   height: 65,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     border: Border.all(color: Palette.black),
              //     image: DecorationImage(
              //       image: AssetImage(AssetName.imgBatman),
              //     ),
              //   ),
              // ),
              PhotoHero(
                      photo: memberModel.avatar ?? '', onTap: () {}, width: 65)
                  .marginOnly(right: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    memberModel.fullName ?? "",
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
        ],
      ),
    );
  }
}
