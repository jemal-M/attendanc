import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Authprovider extends ChangeNotifier {
  List<String> _errors = [];
  List<String> get errors => _errors;
  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonDecode(response.body)['token']);

      // Handle successful login, e.g., save token
    } else {
      _errors.add('Failed to login');
      notifyListeners();
    }
  }
Future<void> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      // Handle successful registration
    } else {
      _errors.add('Failed to register');
      notifyListeners();
    }
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    // Handle logout, e.g., clear token
    _errors.clear();
    notifyListeners();
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future <bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      // Decode the token to extract user ID (this is just an example, adjust as needed)
      Map<String, dynamic> payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(token.split('.')[1]))));
      return payload['userId'];
    }
    return null;
  }

  Future<void> clearErrors() async {
    _errors.clear();
    notifyListeners();
  }
  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }
  Future<void> clearAll() async {
    await clearToken();
    await clearErrors();
  }
  Future<void> refreshToken() async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/refresh'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonDecode(response.body)['token']);
    } else {
      _errors.add('Failed to refresh token');
      notifyListeners();
    }
  }
  Future<void> changePassword(String currentPassword, String newPassword) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/change-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'currentPassword': currentPassword, 'newPassword': newPassword}),
    );

    if (response.statusCode == 200) {

      // Handle successful password change
      _errors.clear();
      notifyListeners();
    } else {
      _errors.add('Failed to change password');
      notifyListeners();
    }
  }
  Future<void> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      // Handle successful password reset request
      _errors.clear();
      notifyListeners();
    } else {
      _errors.add('Failed to send password reset email');
      notifyListeners();
    }
  }
  Future <void> resetPassword(String token, String newPassword) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': token, 'newPassword': newPassword}),
    );

    if (response.statusCode == 200) {
      // Handle successful password reset

      _errors.clear();
      notifyListeners();
    } else {
      _errors.add('Failed to reset password');
      notifyListeners();
    }
  }
  Future<void> verifyEmail(String token) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/auth/verify-email'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': token}),
    );

    if (response.statusCode == 200) {
      // Handle successful email verification
      
      _errors.clear();
      notifyListeners();
    } else {
      _errors.add('Failed to verify email');
      notifyListeners();
    }
  }
}