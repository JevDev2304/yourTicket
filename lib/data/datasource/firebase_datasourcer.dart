import 'package:firebase_auth/firebase_auth.dart';
import 'package:tickets_app/domain/datasource/auth_datasource.dart';

class FirebaseDatasource extends AuthDatasource {
  final FirebaseAuth _auth;

  FirebaseDatasource(this._auth);

  @override
  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        throw Exception("User with this email doesn't exist");
      } else if (exception.code == 'wrong-password') {
        throw Exception("Password incorrect. Try again");
      } else if (exception.code == 'invalid-credential') {
        throw Exception("Incorrect email or password. Try again");
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<User?> signup(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'email-already-in-use') {
        throw Exception("This email is already in use");
      } else if (exception.code == 'invalid-email') {
        throw Exception("Please, enter a valid email");
      } else if (exception.code == 'weak-password') {
        throw Exception("The password is too weak. Try again");
      }
    }
    return null;
  }
}
