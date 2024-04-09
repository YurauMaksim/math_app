import 'package:flutter/material.dart';

class Theory {
  final String id;
  final String subjectId;
  final String chapterId;
  final String gradeId;
  final String topicId;
  final String activityTypeId;
  final String title;
  List<Map<String, String>> theoryData;

  Theory({
    required this.id,
    required this.subjectId,
    required this.chapterId,
    required this.gradeId,
    required this.topicId,
    required this.activityTypeId,
    required this.title,
    required this.theoryData,
  });
}

// TODO here's a class where I can store an image and text and it can be not associated with each other
// class TextAndImageStorage {
//   List<Map<String, dynamic>> data = [];

//   void addTextAndImage(String text, [String? imageUrl]) {
//     data.add({"text": text, "image": imageUrl});
//   }

//   int getDataQuantity() {
//     return data.length;
//   }

//   void displayData() {
//     print("Text and Image Data:");
//     for (var item in data) {
//       print("Text: ${item['text']}");
//       if (item['image'] != null) {
//         print("Image: ${item['image']}");
//       } else {
//         print("Image: (No image associated)");
//       }
//       print("----------------------");
//     }
//   }
// }
