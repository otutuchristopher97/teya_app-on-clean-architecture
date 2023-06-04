import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String firstname;
  String lastname;
  String email;
  String password;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.empty() {
    return UserModel(firstname: '', lastname: '', email: '', password: '');
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        password,
      ];

  @override
  String toString() => jsonEncode(toMap());
}
