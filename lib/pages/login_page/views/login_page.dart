import 'package:family_tracker/controllers/login_controller.dart';
import 'package:family_tracker/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final c = Get.put(LoginController());

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
                controller: c.userNameTextController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => TextField(
                    controller: c.passwordTextController,
                    obscureText: c.isObscure.value,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              c.changeIsObscureVal();
                            },
                            icon: Icon(c.isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (c.validateUserLogin(c.userNameTextController.text,
                      c.passwordTextController.text)) {
                    Get.to(MainWrapper());
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
