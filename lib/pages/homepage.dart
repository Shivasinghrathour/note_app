import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/widgets/blanknote.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    NoteController noteController = Get.put(NoteController());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 75,
          width: 80,
          child: FloatingActionButton(
              shape: CircleBorder(),
              elevation: 5,
              backgroundColor: Theme.of(context).colorScheme.background,
              onPressed: () {
                noteController.showAddNoteDialog();
              },
              child: Center(
                child: SvgPicture.asset(
                  MyIcons.add,
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Obx(() => noteController.hasNote.value
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 10, right: 10),
                      child: Column(
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
                                leading: const Icon(Icons.check),
                                title: Text(
                                  note.note.toString(),
                                  style: const TextStyle(fontSize: 22),
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
                                          String noteIdToDelete =
                                              note.noteI.toString();
                                          noteController
                                              .deleteNote(noteIdToDelete);
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
                      ),
                    )
                  : BlankNote()),
            ],
          ),
        ),
      ),
    );
  }
}
