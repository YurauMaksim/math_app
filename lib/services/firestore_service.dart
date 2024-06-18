import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/theory.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/models/activity_type.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get subjects
  Stream<List<Subject>> getSubjects() {
    return _db.collection('subjects').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Subject.fromFirestore(doc)).toList());
  }

  // Get chapters for a subject
  Stream<List<Chapter>> getChapters(String subjectId) {
    return _db
        .collection('subjects')
        .doc(subjectId)
        .collection('chapters')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Chapter.fromFirestore(doc)).toList());
  }

  // Get grades for a chapter
  Stream<List<Grade>> getGrades(String subjectId, String chapterId) {
    return _db
        .collection('subjects')
        .doc(subjectId)
        .collection('chapters')
        .doc(chapterId)
        .collection('grades')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Grade.fromFirestore(doc)).toList());
  }

  // Get topics for a grade
  Stream<List<Topic>> getTopics(
      String subjectId, String chapterId, String gradeId) {
    return _db
        .collection('subjects')
        .doc(subjectId)
        .collection('chapters')
        .doc(chapterId)
        .collection('grades')
        .doc(gradeId)
        .collection('topics')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Topic.fromFirestore(doc)).toList());
  }

  Stream<List<ActivityType>> getActivityTypes(
      String subjectId, String chapterId, String gradeId, String topicId) {
    return _db
        .collection('subjects')
        .doc(subjectId)
        .collection('chapters')
        .doc(chapterId)
        .collection('grades')
        .doc(gradeId)
        .collection('topics')
        .doc(topicId)
        .collection('activityTypes')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ActivityType.fromFirestore(doc.data()))
            .toList());
  }

  Future<Theory> getTheory(String theoryId) async {
    final snapshot = await _db.collection('theories').doc(theoryId).get();
    return Theory.fromMap(snapshot.data()!);
  }

  void addSubject(Subject subject) {
    final docRef = _db.collection('subjects').doc();
    docRef.set(subject.toFirestore());
  }

  void addChapter(String subjectId, Chapter chapter) {
    final docRef =
        _db.collection('subjects').doc(subjectId).collection('chapters').doc();
    docRef.set(chapter.toFirestore());
  }

  void addGrade(String subjectId, String chapterId, Grade grade) {
    final docRef = _db
        .collection('subjects')
        .doc(subjectId)
        .collection('chapters')
        .doc(chapterId)
        .collection('grades')
        .doc();
    docRef.set(grade.toFirestore());
  }

  void addTopic(
      String subjectId, String chapterId, String gradeId, Topic topic) {
    final docRef = _db
        .collection('subjects')
        .doc(subjectId)
        .collection('chapters')
        .doc(chapterId)
        .collection('grades')
        .doc(gradeId)
        .collection('topics')
        .doc();
    docRef.set(topic.toFirestore());
  }
}
