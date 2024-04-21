import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/auth/login.dart';
import 'package:note_app/pages/homepage.dart';
import 'package:note_app/pages/userprofile/widgets/button.dart';
import 'package:note_app/pages/userprofile/widgets/mytextfield.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: SvgPicture.asset(
                            MyIcons.back,
                            width: 38,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.04),
              Text(
                "Create a new account",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Divider(
                height: Get.height * 0.04,
                thickness: 4,
                indent: 40,
                endIndent: 40,
              ),
              SizedBox(height: Get.height * 0.07),
              MYTDC(
                obscue: false,
                inputAction: TextInputAction.next,
                controller: authController.userName,
                hint: "Name",
                icon: Icons.supervised_user_circle,
              ),
              SizedBox(height: Get.height * 0.03),
              MYTDC(
                obscue: false,
                inputAction: TextInputAction.next,
                controller: authController.email,
                hint: "Email",
                icon: Icons.email_outlined,
              ),
              SizedBox(height: Get.height * 0.03),
              // password field text editing controller (password)
              MYTDC(
                obscue: true,
                inputAction: TextInputAction.done,
                controller: authController.pass,
                hint: "Password",
                icon: Icons.lock_open_outlined,
              ),
              SizedBox(height: Get.height * 0.055),
              // login button

              Button(
                btnName: "Sign up",
                ontap: () {
                  authController.signup();
                  Get.to(() => const Login());
                },
              ),
              SizedBox(height: Get.height * .1),
              // forget pass and signup text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Allready have an account ?",
                        style: TextStyle(
                          fontFamily: "MyFont",
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const Login());
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "MyFont",
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
