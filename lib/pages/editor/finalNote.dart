import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_app/pages/editor/EditorWidgets/saveAndBackTile.dart';

class FinalNote extends StatelessWidget {
  const FinalNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SaveandBack(),
              SizedBox(height: Get.height * .06),
              Row(
                children: [
                  Text(
                    "Title",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.06),
              Row(
                children: [
                  Text(
                    "Type Something ...",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
