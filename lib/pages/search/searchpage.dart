import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/search_controller.dart';

import '../../controller/noteController.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseSearchController firebaseSearchController =
        Get.put(FirebaseSearchController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onChanged: (value) async => await firebaseSearchController
                  .getSearchResult(searchKeyword: value),
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
            Obx(
              () => firebaseSearchController.searchList.isEmpty
                  ? Expanded(
                      child: Image.asset(MyIcons.nosearch),
                    )
                  : ListView.builder(
                      itemCount: firebaseSearchController.searchList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            firebaseSearchController.searchList[index],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
