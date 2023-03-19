import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (error) {
      throw Exception(error);
    }
  }

  // Register with email and password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (error) {
      throw Exception(error);
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      throw Exception(error);
    }
  }

  // Change password
  Future<void> changePassword(String password) async {
    try {
      User user = _auth.currentUser;
      await user.updatePassword(password);
    } catch (error) {
      throw Exception(error);
    }
  }

  // Get current user
  User getCurrentUser() {
    return _auth.currentUser;
  }

  // Get user id
  String getCurrentUserId() {
    return _auth.currentUser.uid;
  }
}
