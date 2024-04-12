import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/model/model.dart';

class NoteController extends GetxController {
  TextEditingController addnote = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNote();
  }

  final noteList = <NoteModel>[].obs;

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  AuthController authController = Get.put(AuthController());

  void showAddNoteDialog() {
    Get.defaultDialog(
      title: "Add Note",
      content: TextFormField(
        controller: addnote,
        decoration: InputDecoration(
          hintText: "Enter your note",
        ),
      ),
      textConfirm: "Add",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      onConfirm: () {
        // Add your note here
        addNote();
        getNote();
        addnote.clear();
        Get.back();
      },
      onCancel: () {
        addnote.clear();
      },
    );
  }

  void addNote() async {
    var notemodel = NoteModel(
      note: addnote.text,
      userName: authController.userName.text,
      noteI: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("note")
        .add(notemodel.toJson());

    getNote();

    Get.snackbar("To do Added", "To do Added to Firestore",
        backgroundColor: Colors.green);
  }
  // getnote from fireStrore

  Future<void> getNote() async {
    try {
      var data = await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("note")
          .get();
      noteList.clear();

      for (var note in data.docs) {
        noteList.add(NoteModel.fromJson(note.data()));
      }
    } catch (ex) {
      Get.snackbar("Error", ex.toString());
    }
  }
}
