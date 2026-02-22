import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';
import 'package:mobile/models/Attendance.dart';

class AttendanceProvider with ChangeNotifier {
  List<Attendance> _attendances = [];

  List<Attendance> get attendances => _attendances;

  Future<void> fetchAttendances() async {
    final response = await http.get(Uri.parse('${baseUrl}/api/attendances'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _attendances = data.map((attendance) => Attendance.fromJson(attendance)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load attendances');
    }
  }
  fetchAttendancesByStudentId(String studentId) async {
    final response = await http.get(Uri.parse('${baseUrl}/api/attendances/student/$studentId'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _attendances = data.map((attendance) => Attendance.fromJson(attendance)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load attendances for student $studentId');
    }
  }

  Future <void> addAttendance(Attendance attendance) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/api/attendances'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(attendance.toJson()),
    );

    if (response.statusCode == 201) {
      _attendances.add(attendance);
      notifyListeners();
    } else {
      throw Exception('Failed to add attendance');
    }
  }
  Future<void> updateAttendance(Attendance attendance) async {
    final response = await http.put(
      Uri.parse('${baseUrl}/api/attendances/${attendance.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(attendance.toJson()),
    );

    if (response.statusCode == 200) {
      int index = _attendances.indexWhere((a) => a.id == attendance.id);
      if (index != -1) {
        _attendances[index] = attendance;
        notifyListeners();
      }
    } else {
      throw Exception('Failed to update attendance');
    }
  }
  Future<void> deleteAttendance(String id) async {
    final response = await http.delete(
      Uri.parse('${baseUrl}/api/attendances/$id'),
    );

    if (response.statusCode == 200) {
      _attendances.removeWhere((attendance) => attendance.id == id);
      notifyListeners();
    } else {
      throw Exception('Failed to delete attendance');
    }
  }
}

