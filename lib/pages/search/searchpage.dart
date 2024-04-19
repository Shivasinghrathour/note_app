import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Column(
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.bodySmall,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      MyIcons.close,
                    ),
                  ),
                ),
                hintText: "Search by the keyword...",
                contentPadding: const EdgeInsets.only(left: 35, top: 35),
                hintStyle: Theme.of(context).textTheme.labelMedium,
                fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Expanded(
              child: Image.asset(MyIcons.nosearch),
            )
          ],
        ),
      ),
    );
  }
}
