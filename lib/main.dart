// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;

import 'app/global_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalBindingSetup();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        final isValidHost = ['presensi.poposerver.my.id']
            .contains(host); // <-- allow only hosts in array
        return isValidHost;
      });
  }
}
