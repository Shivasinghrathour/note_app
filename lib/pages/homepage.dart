import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/controller/noteController.dart';

import 'package:note_app/welcome.dart';
import 'package:note_app/widgets/blanknote.dart';
import 'package:note_app/widgets/noteTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    NoteController noteController = Get.put(NoteController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteController.showAddNoteDialog();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text("Add Your Note"),
        actions: [
          IconButton(
              onPressed: () {
                authController.logout();
                Get.offAll(const Welcome());
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => noteController.hasNote.value ? NoteTile() : BlankNote(),
          ),
        ],
      ),
    );
  }
}
