import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/editor/EditorWidgets/editnotetile.dart';

class EditNote extends StatelessWidget {
  final NoteModel note;

  const EditNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());

    // Set initial values for text fields
    noteController.editnote.text = note.note.toString();
    noteController.editdes.text = note.des.toString();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Your existing EditnoteTile widget
              EditnoteTile(note: note),
              // Use TextFormField for title
              TextFormField(
                controller: noteController.editnote,
                maxLines: null,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge, // Adjust font size/style as needed
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displayLarge, // Adjust font size/style as needed
                ),
              ),
              // Use TextFormField for description
              TextFormField(
                controller: noteController.editdes,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium, // Adjust font size/style as needed
                maxLines: 50,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Type something...",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displayMedium, // Adjust font size/style as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
