import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/homepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: authController.email,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: authController.pass,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () {
                    authController.login();
                    Get.to(() => const HomePage());
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
