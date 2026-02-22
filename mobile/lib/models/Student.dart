import 'package:mobile/models/User.dart';

class Student {
  final String id;
  final String name;
  final String email;

  Student({required this.id, required this.name, required this.email});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
  factory Student.fromUser(User user) {
    return Student(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}