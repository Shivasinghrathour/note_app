import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/authController.dart';

import 'package:note_app/pages/userprofile/widgets/button.dart';
import 'package:note_app/pages/userprofile/widgets/namesection.dart';
import 'package:note_app/pages/userprofile/widgets/namesectionbox.dart';
import 'package:note_app/welcome.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(MyIcons.nosearch),
              ),
              // divider

              // name section
            ),
            const NameSection(itme: "Name"),
            NameSectionBox(
              icon: Icons.account_box_outlined,
              item: authController.userName.text,
            ),
            const SizedBox(height: 15),
            const NameSection(itme: "Password"),
            NameSectionBox(
              icon: Icons.lock_clock_outlined,
              item: authController.userName.text,
            ),
            const SizedBox(height: 15),
            const NameSection(itme: "Date of Birth"),
            NameSectionBox(
              icon: Icons.date_range_outlined,
              item: authController.pass.text,
            ),
            const SizedBox(height: 80),
            Button(
              btnName: "Logout",
              ontap: () {
                authController.logout();
                Get.offAll(const Welcome());
                print("logout");
              },
            )
          ],
        ),
      ),
    );
  }
}
