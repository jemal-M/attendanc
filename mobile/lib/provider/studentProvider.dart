import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';
import 'package:mobile/models/Student.dart';
import 'package:provider/provider.dart';
class StudentProvider with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> fetchStudents() async {
    final response = await http.get(Uri.parse('${baseUrl}/api/students'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _students = data.map((student) => Student.fromJson(student)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load students');
    }
  }
}
Future<void> addStudent(Student student) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/api/students'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(student.toJson()),
    );

    if (response.statusCode == 201) {
      var _students;
      _students.add(student);
      notifyListeners();
    } else {
      throw Exception('Failed to add student');
    }
  }

Future<void> updateStudent(Student student) async {
    final response = await http.put(
      Uri.parse('${baseUrl}/api/students/${student.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(student.toJson()),
    );

    if (response.statusCode == 200) {
      var _students;
      int index = _students.indexWhere((s) => s.id == student.id);
      if (index != -1) {
        _students[index] = student;
        notifyListeners();
      }
    } else {
      throw Exception('Failed to update student');
    }
  }
  
  void notifyListeners() {
  }

Future<void> deleteStudent(String id) async {
    final response = await http.delete(
      Uri.parse('${baseUrl}/api/students/$id'),
    );

    if (response.statusCode == 200) {
      var _students;
      _students.removeWhere((student) => student.id == id);
      notifyListeners();
    } else {
      throw Exception('Failed to delete student');
    }
  }
  