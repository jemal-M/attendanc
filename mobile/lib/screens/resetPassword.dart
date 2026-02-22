import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';

class Resetpassword {
  @override
  Future<void> resetPassword(String email) async {
    // Implement the logic to send a password reset request to the server
    // You can use the http package to make API calls
    // Example:
    final response = await http.post(
      Uri.parse('$baseUrl/reset-password'),
      body: {'email': email},
    );
    if (response.statusCode == 200) {
      // Password reset email sent successfully
      print('Password reset email sent to $email');
    } else {
      // Handle error
      print('Failed to send password reset email. Status code: ${response.statusCode}');
    }
    // Handle the response accordingly

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Reset Password Screen'),
            // You can implement the UI for entering email and new password here
            Padding(padding:  EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),

            ),
             const Padding(padding: EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),

            ),
             ElevatedButton(
              onPressed: () {
                handlePasswordReset() {
                  // Implement the logic to handle password reset
                  // You can call the resetPassword method here with the entered email
                }
                // Handle password reset logic here
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}