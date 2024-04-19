import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/components/color.dart';
import 'package:note_app/components/image.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/pages/homepage.dart';

class SaveDelete extends GetxController {
  NoteController noteController = Get.put(NoteController());
  void saveDelete() {
    Get.defaultDialog(
      content: Column(
        children: [
          SizedBox(
            height: Get.height * 0.0025,
          ),
          SvgPicture.asset(
            MyIcons.info,
            width: 40,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // cancel button
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), color: bgColor),
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Myfont",
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // save button
              InkWell(
                onTap: () {
                  noteController.addNote();
                  Get.to(HomePage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: bgColor, width: 5),
                  ),
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text("Save",
                          style: TextStyle(
                            fontFamily: "Myfont",
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      title: "Save Changes.. ?",
      titlePadding: const EdgeInsets.all(15),
      titleStyle: const TextStyle(
        fontFamily: "Myfont",
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
