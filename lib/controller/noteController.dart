import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/model/model.dart';
import 'package:uuid/uuid.dart';

class NoteController extends GetxController {
  TextEditingController addnote = TextEditingController();
  TextEditingController adddes = TextEditingController();
  TextEditingController editnote = TextEditingController();
  TextEditingController editdes = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null && user.uid.isNotEmpty) {
        await getNote();
      } else {
        noteList.clear();
      }
    });
  }

  final noteList = <NoteModel>[].obs;

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  NoteModel noteModel = Get.put(NoteModel());

  void addNote() async {
    // Generate a v4 (random) id
    const Uuid uuid = Uuid();

    // Get current user
    var currentUser = auth.currentUser;

    // Check if user is not null
    if (currentUser != null) {
      var notemodel = NoteModel(
        note: addnote.text,
        des: adddes.text,
        id: uuid.v4(),
      );
      await db
          .collection("users")
          .doc(currentUser.uid)
          .collection("note")
          .doc(notemodel.id)
          .set(notemodel.toJson());

      getNote();
      addnote.clear();
      adddes.clear();

      Get.snackbar("Note Added", "Note Added to Firestore",
          backgroundColor: Colors.green);
    }
  }

  Future<void> getNote() async {
    try {
      var currentUser = auth.currentUser;
      if (currentUser != null && currentUser.uid.isNotEmpty) {
        var data = await db
            .collection("users")
            .doc(currentUser.uid)
            .collection("note")
            .get();
        noteList.clear();

        for (var note in data.docs) {
          // Check if "note" filed exists in the document
          if (note.data().containsKey("note")) {
            noteList.add(NoteModel.fromJson(note.data()));
          }
        }

        noteList.refresh();
      } else {
        noteList.clear();
      }
    } catch (ex) {
      Get.snackbar("Error", ex.toString());
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      var currentUser = auth.currentUser;
      if (currentUser != null) {
        await db
            .collection("users")
            .doc(currentUser.uid)
            .collection("note")
            .doc(noteId)
            .delete()
            .then((value) => {
                  Get.snackbar("Note Deleted",
                      "Note Successfully Deleted form Firestore",
                      backgroundColor: Colors.green)
                });
        getNote();
      }
    } catch (ex) {
      Get.snackbar("Error", ex.toString());
    }
  }

  Future<void> editNote(String noteDocID) async {
    var currentUser = auth.currentUser;
    if (currentUser != null) {
      await db
          .collection("users")
          .doc(currentUser.uid)
          .collection("note")
          .doc(noteDocID)
          .update({
        "note": editnote.text,
        "des": editdes.text,
      });
      editnote.clear();
      editdes.clear();
      getNote();
    }
  }

  @override
  void onClose() {
    addnote.dispose();
    adddes.dispose();
    editnote.dispose();
    editdes.dispose();
    super.onClose();
  }
}
