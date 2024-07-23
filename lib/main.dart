import 'package:family_tracker/bindings/login_binding.dart';
import 'package:family_tracker/pages/login_page/views/login_page.dart';
import 'package:family_tracker/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      initialBinding: LoginBinding(),
      getPages: AppPage.appPage,
    );
  }
}
