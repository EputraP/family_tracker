import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<UserAuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: controller.userNameTextController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => TextField(
                    controller: controller.passwordTextController,
                    obscureText: controller.isObscure.value,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.changeIsObscureVal();
                            },
                            icon: Icon(controller.isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await controller.validateUserLogin(
                      controller.userNameTextController.text,
                      controller.passwordTextController.text)) {
                    // Get.to(MainWrapper());
                    controller.userNameTextController.clear();
                    controller.passwordTextController.clear();
                    Get.off(MainWrapper());
                  }
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                        Color.fromARGB(255, 35, 173, 242))),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
