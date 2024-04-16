import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/model/model.dart';

class NoteController extends GetxController {
  TextEditingController addnote = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        getNote();
      } else {
        noteList.clear();
      }
    });
    if (auth.currentUser != null) {
      await getNote();
    }
  }

  final noteList = <NoteModel>[].obs;

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  AuthController authController = Get.put(AuthController());
// dialog box
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
        Get.back();
      },
      onCancel: () {
        addnote.clear();
      },
    );
  }

// add note function
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

    Get.snackbar("Note Added", "Note Added to Firestore",
        backgroundColor: Colors.green);
  }

// get note function
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

// delete note function

// delete note function
  Future<void> deleteNote(String noteId) async {
    String noteIds = 
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("note")
          .doc(noteId)
          .delete();
      // After deleting the note, refresh the note list
      await getNote();
      Get.snackbar("Note Deleted", "Note Deleted from Firestore",
          backgroundColor: Colors.red);
    } catch (ex) {
      Get.snackbar("Error", ex.toString());
    }
  }

}
