import 'package:flutter/material.dart';

class ChooseButton extends StatelessWidget {
  const ChooseButton({
    super.key,
    required this.name,
    required this.onTap,
  });

  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 24)),
        child: Text(name));
  }
}
