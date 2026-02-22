import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/constants/constants.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/models/Student.dart';



class Userprovider {
  Future<User> createUser(String name, String email) async {
    final response = await http.post(
      Uri.parse('${baseUrl}/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email}),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<User> getUser(String id) async {
    final response = await http.get(Uri.parse('${baseUrl}/users/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse('${baseUrl}/api/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
  Future<User> updateUser(String id, String name, String email) async {
    final response = await http.put(
      Uri.parse('${baseUrl}/api/users/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('${baseUrl}/api/users/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}

