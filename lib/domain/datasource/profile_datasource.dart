import 'package:tickets_app/domain/model/profile.dart';

abstract class ProfileDatasource {
  Future<void> createUser(String fullName, String username, String password);
  Future<Profile?> fetchProfile(String username);
}
