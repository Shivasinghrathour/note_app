import 'package:flutter/material.dart';
import 'package:note_app/components/image.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(MyIcons.nosearch),
              ),
              // name section
            )
          ],
        ),
      ),
    );
  }
}
