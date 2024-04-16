import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/controller/noteController.dart';
import 'package:note_app/welcome.dart';

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
            () => Column(
              children: noteController.noteList
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.check),
                        title: Text(
                          e.note.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              String noteIdToDelete = e.noteI.toString();

                              print(e.noteI.toString());
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
