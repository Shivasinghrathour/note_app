import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/model/model.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController userName = TextEditingController();
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
}
