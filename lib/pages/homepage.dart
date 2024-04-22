import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/pages/editor/editor.dart';
import 'package:note_app/pages/editor/finalNote.dart';
import 'package:note_app/widgets/blanknote.dart';
import 'package:note_app/widgets/notesearchtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 75,
          width: 80,
          child: FloatingActionButton(
              shape: const CircleBorder(),
              elevation: 5,
              backgroundColor: Theme.of(context).colorScheme.background,
              onPressed: () {
                Get.to(const Editor());
              },
              child: Center(
                child: SvgPicture.asset(
                  MyIcons.add,
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
            child: Column(
              children: [
                const NoteSearchtile(),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => noteController.hasNote.value
                    ? Column(
                        children: List.generate(
                          noteController.noteList.length,
                          (i) {
                            final note = noteController.noteList[i];
                            final Color backgroundColor = i % 2 == 0
                                ? Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                : Theme.of(context).colorScheme.background;

                            return InkWell(
                              onTap: () {
                                Get.to(FinalNote(note: note));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      note.note.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const BlankNote()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
