import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    // ignore: non_constant_identifier_names
    required String Email,
    // ignore: non_constant_identifier_names
    required String Password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: Email, password: Password);
  }

  Future<void> createUserWithEmailAndPassword({
    // ignore: non_constant_identifier_names
    required String Email,
    // ignore: non_constant_identifier_names
    required String Password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: Email, password: Password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
