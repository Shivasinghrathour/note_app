import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/model/model.dart';

class NameSectionBox extends StatelessWidget {
  final IconData icon;
  final String item;

  const NameSectionBox({
    super.key,
    required this.icon,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              icon,
              size: 32,
            ),
          ),
          Text(
            item,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
