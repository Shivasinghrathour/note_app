import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/editor/priviewnote.dart';
import 'package:note_app/pages/homepage.dart';

class EditnoteTile extends StatelessWidget {
  final NoteModel note;
  const EditnoteTile({super.key, required this.note});

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
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: IconButton(
                    onPressed: () {
                      noteController.editNote(note.id.toString());
                      Get.off(const HomePage());
                    },
                    icon: const Icon(Icons.edit_calendar_outlined)),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: IconButton(
                  onPressed: () {
                    Get.to(
                      const PreviewNote(),
                    );
                  },
                  icon: SvgPicture.asset(
                    MyIcons.visibility,
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
