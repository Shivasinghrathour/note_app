import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/pages/search/searchpage.dart';

import 'package:note_app/pages/userprofile/userprofile.dart';

class NoteSearchtile extends StatelessWidget {
  const NoteSearchtile({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notes",
          style: Theme.of(context).textTheme.displayLarge,
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
                    Get.to(SearchPage());
                  },
                  icon: SvgPicture.asset(
                    MyIcons.search,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: IconButton(
                    onPressed: () {
                      Get.to(UserProfile());
                    },
                    icon: const Icon(
                      Icons.apps_outlined,
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
