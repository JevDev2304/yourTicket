import 'package:tickets_app/domain/model/profile.dart';

abstract class ProfileDatasource {
  Future<void> createUser(String fullName, String email, String password);
  Future<Profile?> fetchProfile(String email);
}
