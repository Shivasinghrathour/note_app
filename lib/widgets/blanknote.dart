import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/widgets/notesearchtile.dart';

class BlankNote extends StatelessWidget {
  const BlankNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.25,
        ),
        Image.asset(MyIcons.blank),
        SizedBox(height: Get.height * 0.025),
        Text(
          "Create your first note !",
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
