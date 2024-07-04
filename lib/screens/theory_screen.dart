import 'package:flutter/material.dart';
import 'package:math_app/models/theory.dart';
import 'package:math_app/services/firestore_service.dart';

class TheoryScreen extends StatelessWidget {
  final String theoryId;

  TheoryScreen({required this.theoryId});

  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Теория'),
      ),
      body: StreamBuilder<Theory>(
        stream: _firestoreService.getTheory(theoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final theory = snapshot.data!;
            return ListView.builder(
              itemCount: theory.contentBlocks.length,
              itemBuilder: (context, index) {
                final contentBlock = theory.contentBlocks[index];
                if (contentBlock.type == 'text') {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(contentBlock.content),
                  );
                } else if (contentBlock.type == 'image') {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: theory.isLocal
                        ? Image.asset(contentBlock.content) // Local image
                        : Image.network(contentBlock.content), // Network image
                  );
                }
                return SizedBox.shrink(); // In case of an unknown type
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
