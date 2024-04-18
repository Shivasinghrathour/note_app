import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/pages/editor/EditorWidgets/saveAndBackTile.dart';

class Editor extends StatelessWidget {
  const Editor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SaveandBack(),
              SizedBox(height: Get.height * .035),
              TextFormField(
                maxLines: 2,
                style: Theme.of(context).textTheme.displayLarge,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              TextFormField(
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 50,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Type something...",
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
