import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/controller/authController.dart';
import 'package:note_app/model/model.dart';

class NoteController extends GetxController {
  // add note controller
  TextEditingController addnote = TextEditingController();
  TextEditingController adddes = TextEditingController();
  // edit note controller
  TextEditingController editnote = TextEditingController();
  TextEditingController editdes = TextEditingController();

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
  NoteModel noteModel = Get.put(NoteModel());

  void addNote() async {
    var currentUser = auth.currentUser;
    if (currentUser != null) {
      var notemodel = NoteModel(
        note: addnote.text,
        des: adddes.text,
        userName: authController.userName.text,
        noteI: DateTime.now().millisecondsSinceEpoch.toString(),
      );
      await db
          .collection("users")
          .doc(currentUser.uid)
          .collection("note")
          .doc(notemodel.noteI)
          .set(
            notemodel.toJson(),
          );

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
      if (currentUser != null) {
        var data = await db
            .collection("users")
            .doc(currentUser.uid)
            .collection("note")
            .get();
        noteList.clear();

        for (var note in data.docs) {
          noteList.add(NoteModel.fromJson(note.data()));
        }

        // Update hasNote based on noteList

        noteList.refresh();
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
}
