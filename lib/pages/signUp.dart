import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Sign up"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: authController.userName,
                decoration: const InputDecoration(
                  hintText: "User Name",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
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
                  authController.signup();
                  Get.to(() => const Login());
                },
                child: const Text("Sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
