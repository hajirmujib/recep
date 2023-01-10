import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_controller.dart';

class UploadView extends GetView<UploadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UploadView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
