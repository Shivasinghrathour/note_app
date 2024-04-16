import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/pages/homepage.dart';
import 'package:note_app/welcome.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Splashfunction();
  }

  final auth = FirebaseAuth.instance;

  void Splashfunction() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (auth.currentUser == null) {
      Get.to(() => const Welcome());
    } else {
      Get.to(() => const HomePage());
    }
  }
}
