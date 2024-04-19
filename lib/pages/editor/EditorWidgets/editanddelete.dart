import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/controller/saveanddelete.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/editor/finalNote.dart';
import 'package:note_app/pages/editor/priviewnote.dart';
import 'package:note_app/pages/homepage.dart';

class EditandDelete extends StatelessWidget {
  final NoteModel note;
  const EditandDelete({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());
    SaveDelete saveDelete = Get.put(SaveDelete());
    NoteModel noteModel = Get.put(NoteModel());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(15)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              MyIcons.back,
              width: 38,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  saveDelete.saveDelete();
                },
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(
                    MyIcons.edit,
                    color: Theme.of(context).colorScheme.primary,
                    width: 30,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  String noteIdToDelete = note.noteI.toString();
                  noteController.deleteNote(noteIdToDelete);
                  Get.to(HomePage());
                },
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(
                    MyIcons.bin,
                    color: Theme.of(context).colorScheme.primary,
                    width: 29,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
