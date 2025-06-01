import 'package:firebase_auth/firebase_auth.dart';
import 'package:tickets_app/domain/datasource/auth_datasource.dart';

class AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepository(this._authDatasource);

  Stream<User?> get authStateChange => FirebaseAuth.instance.idTokenChanges();

  Future<User?> login(String email, String password) async {
    return _authDatasource.login(email, password);
  }

  Future<User?> signup(String email, String password) async {
    return _authDatasource.signup(email, password);
  }

  Future<void> logout() async {
    _authDatasource.logout();
  }
}
