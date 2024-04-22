import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/model/user_model.dart';
import 'package:note_app/pages/homepage.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController userName = TextEditingController();

  Rx<UserModel?> userModel = UserModel().obs;

  // signup Functuion
  Future<void> signup() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );

      // Store the user name
      await storeUserName();

      Get.snackbar(
        "Account Created",
        "Plese Login to Continue",
        backgroundColor: Colors.green,
      );

      Get.to(() => const HomePage());
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
  // login function

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );
      Get.snackbar(
        "Logged in",
        "Welcome to Note App",
        backgroundColor: Colors.green,
      );
    } catch (ex) {
      Get.snackbar("Error", ex.toString(), backgroundColor: Colors.red);
    }
  }

  // logout function
  void logout() async {
    await auth.signOut();
  }

  Future<void> storeUserName() async {
    try {
      if (auth.currentUser != null && auth.currentUser!.uid.isNotEmpty) {
        // Store the user data in the userModel
        userModel.value = UserModel(
          userName: userName.text,
          email: email.text,
        );

        // Store the user data in the firestore
        firestore
            .collection("users")
            .doc(auth.currentUser!.uid)
            .collection("note")
            .doc(auth.currentUser!.uid)
            .set(userModel.value!.toJson());
      } else {
        print("user not found");

        return;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<void> getUserData() async {
    try {
      // Get the current user
      final user = auth.currentUser;

      // Check if the user is not nullou
      if (user != null && user.uid.isNotEmpty) {
        final collectionRef = await firestore
            .collection("users")
            .doc(user.uid)
            .collection("note")
            .doc(user.uid)
            .get();

        // If the user is not null, we will get the user data
        final data = collectionRef.data();

        if (data != null) {
          userModel.value!.userName = data["userName"];
          userModel.value!.email = data["email"];

          userModel.refresh();
        } else {
          return;
        }
      } else {
        return;
      }
    } catch (ex) {
      Get.snackbar("Error", ex.toString(), backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
  }
}
