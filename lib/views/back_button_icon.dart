import 'package:flutter/material.dart';

class BackOutlinedButtonIcon extends StatelessWidget {
  const BackOutlinedButtonIcon({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
        icon: const Icon(Icons.arrow_back_outlined),
        label: const Text('Назад'));
  }
}
