import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/editor/EditorWidgets/editnotepage.dart';
import 'package:note_app/pages/homepage.dart';

class EditandDelete extends StatelessWidget {
  final NoteModel note;

  const EditandDelete({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());

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
                  Get.to(EditNote(
                    note: note,
                  ));
                },
                icon: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.edit_note_outlined,
                      size: 30,
                    )),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  String noteIdToDelete = note.noteI.toString();
                  noteController.deleteNote(noteIdToDelete);
                  Get.to(const HomePage());
                },
                icon: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.delete_outlined,
                      size: 30,
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
