import 'package:flutter/material.dart';

class MYTDC extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputAction inputAction;
  const MYTDC({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: inputAction,
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
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
