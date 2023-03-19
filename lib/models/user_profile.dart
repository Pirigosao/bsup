import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String lastName;
  final String nickname;
  final String phone;
  final String state;
  final String street;
  final String number;
  final String complement;
  final String city;
  final String district;
  final String postalCode;

  UserProfile({
    required this.name,
    required this.lastName,
    required this.nickname,
    required this.phone,
    required this.state,
    required this.street,
    required this.number,
    required this.complement,
    required this.city,
    required this.district,
    required this.postalCode,
  });

  factory UserProfile.fromMap(Map<String, dynamic> data) {
    return UserProfile(
      name: data['name'],
      lastName: data['lastName'],
      nickname: data['nickname'],
      phone: data['phone'],
      state: data['state'],
      street: data['street'],
      number: data['number'],
      complement: data['complement'],
      city: data['city'],
      district: data['district'],
      postalCode: data['postalCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastName': lastName,
      'nickname': nickname,
      'phone': phone,
      'state': state,
      'street': street,
      'number': number,
      'complement': complement,
      'city': city,
      'district': district,
      'postalCode': postalCode,
    };
  }
}