import 'package:tickets_app/domain/datasource/profile_datasource.dart';
import 'package:tickets_app/domain/model/profile.dart';

class ProfileRepository {
  final ProfileDatasource _profileDatasource;

  ProfileRepository(this._profileDatasource);

  Future<void> createUser(String fullName, String username, String password) {
    return _profileDatasource.createUser(fullName, username, password);
  }

  Future<Profile?> getProfile(String username) {
    return _profileDatasource.fetchProfile(username);
  }
}
