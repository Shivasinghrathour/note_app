import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/pages/editor/EditorWidgets/saveAndBackTile.dart';

class Editor extends StatelessWidget {
  const Editor({super.key});

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 10),
        child: Column(
          children: [
            const SaveandBack(),
            SizedBox(height: Get.height * 0.02),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: noteController.addnote,
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
                      controller: noteController.adddes,
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
            )
          ],
        ),
      ),
    );
  }
}
