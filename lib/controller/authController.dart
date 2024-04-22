import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/model/user_model.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController userName = TextEditingController();

  // This is the user model that will be updated based on the user's state
  final Rx<UserModel?> userModel = Rx<UserModel?>(null);

  // signup Functuion

  void signup() async {
    auth.createUserWithEmailAndPassword(
      email: email.text,
      password: pass.text,
    );
    Get.snackbar(
      "Account Created",
      "Plese Login to Continue",
      backgroundColor: Colors.green,
    );
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

  Future<void> getUserData() async {
    try {
      // Get the current user
      final user = auth.currentUser;

      // Check if the user is not nullou
      if (user != null) {
        final collectionRef =
            await firestore.collection("users").doc(user.uid).get();

        // If the user is not null, we will get the user data
        final data = collectionRef.data() as Map<String, dynamic>;

        // We will update the user model
        userModel.value = UserModel(
          email: data["email"],
          userName: data["userName"],
        );

        print(userModel.value!.userName);
      }
    } catch (ex) {
      Get.snackbar("Error", ex.toString(), backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
