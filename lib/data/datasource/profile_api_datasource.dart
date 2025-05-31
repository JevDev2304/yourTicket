import 'package:tickets_app/domain/datasource/profile_datasource.dart';
import 'package:tickets_app/domain/model/profile.dart';

class ProfileApiDatasource extends ProfileDatasource {
  @override
  Future<void> createUser(String fullName, String username, String password) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Profile?> fetchProfile(String username) {
    // TODO: implement fetchProfile
    throw UnimplementedError();
  }
}
