import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/saveanddelete.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/editor/finalNote.dart';
import 'package:note_app/pages/editor/priviewnote.dart';

class SaveandBack extends StatelessWidget {
  const SaveandBack({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: IconButton(
                  onPressed: () {
                    saveDelete.saveDelete();
                  },
                  icon: SvgPicture.asset(
                    MyIcons.save,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: IconButton(
                  onPressed: () {
                    Get.to(
                      PriviewNote(),
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
