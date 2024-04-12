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
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text("Add Your Note"),
        actions: [
          IconButton(
              onPressed: () {
                authController.logout();
                Get.offAll(Welcome());
              },
              icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Obx(() => Column(
              children: noteController.noteList
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.check),
                        title: Text(
                          e.note.toString(),
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  )
                  .toList()))
        ],
      ),
    );
  }
}
