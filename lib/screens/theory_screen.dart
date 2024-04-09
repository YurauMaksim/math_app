import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:math_app/models/subject.dart';
import 'package:math_app/models/theory.dart';

class TheoryScreen extends StatelessWidget {
  final Theory theory;

  const TheoryScreen({super.key, required this.theory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theory.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              theory.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            for (var block in theory.theoryData)
              for (var text in block.entries)
                Column(
                  children: [
                    Text(text.key),
                    SizedBox(
                      height: 16,
                    ),
                    if (text.value != "no_image")
                      Image.asset(
                        alignment: Alignment.center,
                        text.value,
                        fit: BoxFit.contain,
                      )
                    else
                      SizedBox(
                        height: 5,
                      ),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
