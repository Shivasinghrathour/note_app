import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnName;
  final IconData btnicon;
  final VoidCallback ontap;
  const Button(
      {super.key,
      required this.btnName,
      required this.btnicon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                btnicon,
                size: 32,
              ),
            ),
            Text(
              btnName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
