import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

// Future<void> newShot(DateTime targetDateTime, int id) async {
//   await AndroidAlarmManager.oneShotAt(targetDateTime, id, printHello(),
//       alarmClock: true, rescheduleOnReboot: true);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
