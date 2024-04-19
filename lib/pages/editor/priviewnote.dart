import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/pages/editor/EditorWidgets/saveAndBackTile.dart';

class PreviewNote extends StatelessWidget {
  const PreviewNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SaveandBack(),
              SizedBox(height: Get.height * .04),
              Text(
                noteController.addnote.text,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: Get.height * 0.06),
              Text(
                noteController.adddes.text,
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
