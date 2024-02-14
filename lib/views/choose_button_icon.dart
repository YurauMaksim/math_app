import 'package:flutter/material.dart';

class ChooseButtonIcon extends StatelessWidget {
  const ChooseButtonIcon({super.key, required this.name, required this.onTap});

  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
        icon: const Icon(Icons.arrow_right_outlined),
        label: Text(name));
  }
}
