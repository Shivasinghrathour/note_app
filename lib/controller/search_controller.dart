import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseSearchController extends GetxController {
  // Instance of FirebaseAuth and FirebaseFirestore
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // RxList is a list that can be observed by GetX
  RxList<String> searchList = <String>[].obs;

  Future<void> getSearchResult({required String searchKeyword}) async {
    try {
      final allNotes = await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("note")
          .get();

      searchList.clear();

      for (var doc in allNotes.docs) {
        if (doc["note"].contains(searchKeyword)) {
          searchList.add(doc.data()["note"]);

          // Update the UI
          searchList.refresh();
        } else {
          return;
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
