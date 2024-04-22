import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:note_app/components/image.dart';

import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/homepage.dart';
import 'package:note_app/pages/auth/signUp.dart';
import 'package:note_app/pages/userprofile/widgets/button.dart';
import 'package:note_app/pages/userprofile/widgets/mytextfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
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

            // login heading text
            Text(
              "Login to \nDigital Notes",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Divider
            Divider(
              height: Get.height * 0.04,
              thickness: 4,
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(height: Get.height * 0.07),
            // my text editing controller (email)
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
              inputAction: TextInputAction.go,
              controller: authController.pass,
              hint: "Password",
              icon: Icons.lock_open_outlined,
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      fontFamily: "MyFont",
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.055),
            // login button

            Button(
              btnName: "Login",
              ontap: () {
                authController.login();
                Get.to(() => const HomePage());
              },
            ),
            SizedBox(height: Get.height * .14),
            // forget pass and signup text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Text(
                      "Dont't have an account ?",
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
                        Get.to(Signup());
                      },
                      child: const Text(
                        "Sign Up",
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
    );
  }
}
