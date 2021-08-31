import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superformula_test/core/app/routes/routes.dart';
import 'package:superformula_test/modules/qr_code/qr_code.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.QrCode);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
