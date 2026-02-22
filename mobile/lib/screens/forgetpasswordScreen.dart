import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';
import 'package:mobile/models/User.dart';
class Forgetpasswordscreen {
  get email => null;

  Future<void> resetPassword(email) async {
    final url = Uri.parse('${baseUrl}/api/auth/reset-password');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      // Password reset email sent successfully
      print('Password reset email sent to $email');
    } else {
      // Handle error
      print('Failed to send password reset email. Status code: ${response.statusCode}');
    }
  }
  Future<void> updatePassword(token, newPassword) async {
    final url = Uri.parse('${baseUrl}/api/auth/update-password');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': token, 'newPassword': newPassword}),
    );

    if (response.statusCode == 200) {
      // Password updated successfully
      print('Password updated successfully');
    } else {
      // Handle error
      print('Failed to update password. Status code: ${response.statusCode}');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forget Password Screen'),
            // You can implement the UI for entering email and new password here
            Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    resetPassword(email);
                    // Handle password reset logic here
                  },
                  child: const Text('Reset Password'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}