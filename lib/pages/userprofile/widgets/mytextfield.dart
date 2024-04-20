import 'package:flutter/material.dart';

class MYTDC extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  const MYTDC(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.displaySmall,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Icon(
            icon,
          ),
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.only(left: 35, top: 35),
        hintStyle: Theme.of(context).textTheme.labelMedium,
        fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
