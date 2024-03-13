// final url = Uri.https(
//       'math-application-9af6e-default-rtdb.europe-west1.firebasedatabase.app',
//       'subjectList.json');
//   final response = await http.get(url);
//   print(response.body);

//   final Map<String, dynamic> listSubjectsFromDB = json.decode(response.body);
//   print(listSubjectsFromDB);
//   final List<Subject> _listSubjects = [];
//   for (final item in listSubjectsFromDB.entries) {
//     _listSubjects
//         .add(Subject(id: item.key, subjectName: item.value['subject']));
//   }

//   for (final item in _listSubjects) {
//     print(item!.subjectName);
//   }

//this code for getting certain information from firebase perfectly works!