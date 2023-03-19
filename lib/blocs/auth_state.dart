import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends Equatable {
  final User? user;
  final String? errorMessage;
  final bool isLoading;

  const AuthState({
    @required this.user,
    @required this.isLoading,
    this.errorMessage,
  });

  factory AuthState.initial() {
    return AuthState(user: null, isLoading: false);
  }

  factory AuthState.loading() {
    return AuthState(user: null, isLoading: true);
  }

  factory AuthState.loaded(User user) {
    return AuthState(user: user, isLoading: false);
  }

  factory AuthState.error(String errorMessage) {
    return AuthState(user: null, isLoading: false, errorMessage: errorMessage);
  }

  @override
  List<Object?> get props => [user, errorMessage, isLoading];
}
