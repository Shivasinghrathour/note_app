import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/pages/auth/login.dart';
import 'package:note_app/pages/auth/signUp.dart';
import 'package:note_app/pages/userprofile/widgets/button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: Get.height * 0.025),
              Image.asset(
                MyIcons.logo,
                scale: 2.8,
                color: Colors.white70,
              ),
              SizedBox(height: Get.height * 0.025),
              Text(
                "Welcome to \nD i g i t a l   N o t e s",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Divider(
                height: Get.height * 0.07,
                thickness: 4,
                indent: 40,
                endIndent: 40,
              ),
              Text(
                "Welcome to our note-taking app! Start jotting, organizing, and creating with ease. Your ideas, your way, anytime, anywhere.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Spacer(),
              Button(
                  btnName: "Login",
                  ontap: () {
                    Get.to(Login());
                  }),
              SizedBox(height: Get.height * 0.02),
              Button(
                  btnName: "Sign up",
                  ontap: () {
                    Get.to(Signup());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
