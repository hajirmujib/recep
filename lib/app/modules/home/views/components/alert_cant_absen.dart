
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysleep/app/constants/assets_path.dart';
import 'package:mysleep/app/constants/fonts.dart';
import 'package:mysleep/app/constants/pallete.dart';

Container alertCantAbsen() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      height: 150,
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(26), topLeft: Radius.circular(26))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.secondary.withOpacity(0.1),
                ),
                child: Center(
                  child: Image.asset(
                    AssetName.iconPin,
                    width: 30,
                    height: 30,
                    color: Palette.secondary,
                  ),
                ),
              ).marginOnly(right: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lokasi Anda\nTidak Masuk Jangkauan',
                    style: FontHeader.h15.copyWith(
                      color: Palette.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Radius Jangkauan 50 Meter',
                    style: FontBody.s12.copyWith(
                      color: Palette.gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }