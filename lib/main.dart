import 'package:family_tracker/bindings/login_binding.dart';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/pages/login_page/controllers/login_controller.dart';
import 'package:family_tracker/pages/login_page/views/login_page.dart';
import 'package:family_tracker/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final userAuthController = Get.put(UserAuthController());
  // final c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialBinding: LoginBinding(),
      getPages: AppPage.appPage,
    );
  }
}
