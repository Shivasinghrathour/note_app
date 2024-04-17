import 'package:flutter/material.dart';

class BlankNote extends StatelessWidget {
  const BlankNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.edit_calendar_rounded,
              size: 250,
            ),
          ),
          SizedBox(height: 50),
          Text(
            "Tap + to add note",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
