import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/splashController.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Text("Note App"),
      ),
    );
  }
}
