import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';
import 'package:mobile/models/User.dart';
class Attendancescreen {
  Future<void> markAttendance(userId) async {
    final url = Uri.parse('${baseUrl}/api/attendance/mark');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId}),
    );

    if (response.statusCode == 200) {
      // Attendance marked successfully
      print('Attendance marked for user ID: $userId');
    } else {
      // Handle error
      print('Failed to mark attendance. Status code: ${response.statusCode}');
    }
  }
  Future<void> viewAttendance(userId) async {
    final url = Uri.parse('${baseUrl}/api/attendance/view?userId=$userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse attendance data
      final attendanceData = jsonDecode(response.body);
      print('Attendance data for user ID: $userId: $attendanceData');
    } else {
      // Handle error
      print('Failed to retrieve attendance. Status code: ${response.statusCode}');
    }
  }
  Future<void> viewAllAttendance() async {
    final url = Uri.parse('${baseUrl}/api/attendance/viewAll');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse attendance data
      final attendanceData = jsonDecode(response.body);
      print('All attendance data: $attendanceData');
    } else {
      // Handle error
      print('Failed to retrieve attendance. Status code: ${response.statusCode}');
    }
  }
  Future <void> viewAttendanceByDate(date) async {
    final url = Uri.parse('${baseUrl}/api/attendance/viewByDate?date=$date');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse attendance data
      final attendanceData = jsonDecode(response.body);
      print('Attendance data for date: $date: $attendanceData');
    } else {
      // Handle error
      print('Failed to retrieve attendance. Status code: ${response.statusCode}');
    }
  }
  Future<void> viewAttendanceByUser(userId) async {
    final url = Uri.parse('${baseUrl}/api/attendance/viewByUser?userId=$userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse attendance data
      final attendanceData = jsonDecode(response.body);
      print('Attendance data for user ID: $userId: $attendanceData');
    } else {
      // Handle error
      print('Failed to retrieve attendance. Status code: ${response.statusCode}');
    }
  }
  Future <void> viewAttendanceByStatus(status) async {
    final url = Uri.parse('${baseUrl}/api/attendance/viewByStatus?status=$status');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse attendance data
      final attendanceData = jsonDecode(response.body);
      print('Attendance data for status: $status: $attendanceData');
    } else {
      // Handle error
      print('Failed to retrieve attendance. Status code: ${response.statusCode}');
    }
  }
  Future<void> viewAttendanceByUserAndDate(userId,date) async {
    final url = Uri.parse('${baseUrl}/api/attendance/viewByUserAndDate?userId=$userId&date=$date');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse attendance data
      final attendanceData = jsonDecode(response.body);
      print('Attendance data for user ID: $userId and date: $date: $attendanceData');
    } else {
      // Handle error
      print('Failed to retrieve attendance. Status code: ${response.statusCode}');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Attendance data will be displayed here'),
            // You can replace the above Text widget with a ListView.builder
            // to display the attendance data fetched from your backend.
              ListTile(
                title: Text('Attendance Record 1'),
                subtitle: Text('Details of Attendance Record 1'),
  
              ),
                ListTile(
                  title: Text('Attendance Record 2'),
                  subtitle: Text('Details of Attendance Record 2'),
    
                ),
                ListTile(
                  title: Text('Attendance Record 3'),
                  subtitle: Text('Details of Attendance Record 3'),
    
                ),
                
          ],
        ),
      ),
    );
  }
}