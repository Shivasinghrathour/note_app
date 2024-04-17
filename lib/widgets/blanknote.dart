import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/image.dart';

class BlankNote extends StatelessWidget {
  const BlankNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          MyIcons.search,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          MyIcons.info,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.25,
          ),
          Image.asset(MyIcons.blank),
          SizedBox(height: Get.height * 0.025),
          Text(
            "Create your first note !",
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
