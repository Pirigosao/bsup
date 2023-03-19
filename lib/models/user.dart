import 'package:flutter/material.dart';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String lastName;
  final String displayName;
  final String phoneNumber;
  final String state;
  final String street;
  final String number;
  final String complement;
  final String city;
  final String district;
  final String postalCode;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.displayName,
    required this.phoneNumber,
    required this.state,
    required this.street,
    required this.number,
    required this.complement,
    required this.city,
    required this.district,
    required this.postalCode,
  });
}
