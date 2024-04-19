import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/editor/EditorWidgets/editanddelete.dart';
import 'package:note_app/pages/editor/EditorWidgets/saveAndBackTile.dart';

class FinalNote extends StatelessWidget {
  final NoteModel note;
  const FinalNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());
    NoteModel noteModel = Get.put(NoteModel());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditandDelete(
                note: note,
              ),
              SizedBox(height: Get.height * .04),
              Container(
                child: Text(
                  note.note.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: Get.height * 0.06),
              Container(
                child: Text(
                  note.des.toString(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
