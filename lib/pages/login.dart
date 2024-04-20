import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/homepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.15),
            Text(
              "Login to Create Digital Notes",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: Get.height * 0.025,
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
    );
  }
}
