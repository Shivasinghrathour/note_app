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
            child: Image.asset("assets/icons/image.png"),
          ),
          SizedBox(height: 50),
          Text(
            "Tap + to add note",
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}
