import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapUserLoggedInToState(event.user);
    } else if (event is LoggedOut) {
      yield* _mapUserLoggedOutToState();
    } else if (event is ContinueWithEmailEvent) {
      yield AuthState.loading();
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
        yield AuthState.loaded(userCredential.user!);
      } on FirebaseAuthException catch (e) {
        yield AuthState.error(errorMessage: e.message!);
      } catch (e) {
        yield AuthState.error(errorMessage: 'Something went wrong');
      }
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = _auth.currentUser != null;
      if (isSignedIn) {
        yield AuthState.loaded(_auth.currentUser!);
      } else {
        yield AuthState.error(errorMessage: 'Not authenticated');
      }
    } catch (_) {
      yield AuthState.error(errorMessage: 'Not authenticated');
    }
  }

  Stream<AuthState> _mapUserLoggedInToState(User user) async* {
    yield AuthState.loaded(user);
  }

  Stream<AuthState> _mapUserLoggedOutToState() async* {
    yield AuthState.error(errorMessage: 'Not authenticated');
  }
}
