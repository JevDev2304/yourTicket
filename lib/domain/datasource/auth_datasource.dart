import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<User?> login(String email, String password);
  Future<void> logout();
  Future<User?> signup(String email, String password);
}
