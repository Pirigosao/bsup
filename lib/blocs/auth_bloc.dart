import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState();
    } else if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState();
    } else if (event is ContinueWithEmailEvent) {
      yield AuthLoading();
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
        yield AuthSuccess(userCredential.user!);
      } on FirebaseAuthException catch (e) {
        yield AuthFailure(errorMessage: e.message);
      } catch (e) {
        yield AuthFailure(errorMessage: 'Something went wrong');
      }
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = _auth.currentUser != null;
      if (isSignedIn) {
        yield AuthSuccess(_auth.currentUser!);
      } else {
        yield AuthFailure();
      }
    } catch (_) {
      yield AuthFailure();
    }
  }

  Stream<AuthState> _mapUserLoggedInToState() async* {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      yield AuthSuccess(currentUser);
    }
  }

  Stream<AuthState> _mapUserLoggedOutToState() async* {
    yield AuthFailure();
  }
}
