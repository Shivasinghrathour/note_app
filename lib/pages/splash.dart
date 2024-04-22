import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/splashController.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MyIcons.logo,
              scale: 2.8,
              color: Colors.white70,
            ),
            // SizedBox(height: Get.height * 0.025),
            Divider(
              height: Get.height * 0.07,
              thickness: 4,
              indent: 30,
              endIndent: 30,
            ),
            Text(
              "D i g i t a l   N o t e s",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
