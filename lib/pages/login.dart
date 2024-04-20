import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/homepage.dart';
import 'package:note_app/pages/userprofile/widgets/button.dart';
import 'package:note_app/pages/userprofile/widgets/mytextfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: ListView(
          children: [
            SizedBox(height: Get.height * 0.15),
            Text(
              "Login to Create Digital Notes",
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
              inputAction: TextInputAction.next,
              controller: authController.email,
              hint: "Email",
              icon: Icons.email_outlined,
            ),
            SizedBox(height: Get.height * 0.03),
            // password field
            MYTDC(
              inputAction: TextInputAction.go,
              controller: authController.pass,
              hint: "Password",
              icon: Icons.lock_open_outlined,
            ),
            SizedBox(height: Get.height * 0.055),
            Button(
              btnName: "Login",
              ontap: () {
                authController.login();
                Get.to(() => const HomePage());
              },
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Text("Forget Password"),
                InkWell(
                  onTap: () {},
                  child: Text("data"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
