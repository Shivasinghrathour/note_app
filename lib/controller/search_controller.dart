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
      final allNotes = firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("note")
          .where("searchBy", isEqualTo: searchKeyword.toLowerCase());

      final querySnapshot = await allNotes.get();

      if (querySnapshot.docs.isNotEmpty) {
        searchList.clear();
        for (final doc in querySnapshot.docs) {
          searchList.add(doc["note"]);
        }

        print(searchList);
      } else {
        searchList.clear();
        return;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
