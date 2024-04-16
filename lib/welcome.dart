import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/pages/login.dart';
import 'package:note_app/pages/signUp.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const Login());
                },
                child: const Text("Login")),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Signup());
              },
              child: const Text(
                "Sign Up",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
