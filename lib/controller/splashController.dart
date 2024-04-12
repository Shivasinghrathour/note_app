import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:note_app/pages/homepage.dart';
import 'package:note_app/welcome.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Splashfunction();
  }

  final auth = FirebaseAuth.instance;

  void Splashfunction() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    if (auth.currentUser == null) {
      Get.to(Welcome());
    } else {
      Get.to(HomePage());
    }
  }
}
