import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/noteController.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({Key? key});

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());
    return Column(
      children: List.generate(
        noteController.noteList.length,
        (i) {
          final note = noteController.noteList[i];
          final Color backgroundColor =
              i % 2 == 0 ? Colors.white : Colors.yellowAccent;

          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(500),
                child: Text(
                  note.note.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    // edit icon
                    IconButton(
                      onPressed: () {
                        noteController.showEditNoteDialog(
                          docNoteID: note.noteI.toString(),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    // delete icon
                    IconButton(
                      onPressed: () {
                        String noteIdToDelete = note.noteI.toString();
                        noteController.deleteNote(noteIdToDelete);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
