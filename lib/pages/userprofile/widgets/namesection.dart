import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/pages/userprofile/widgets/namesectionbox.dart';

class NameSection extends StatelessWidget {
  final String itme;
  const NameSection({super.key, required this.itme});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            itme,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}
