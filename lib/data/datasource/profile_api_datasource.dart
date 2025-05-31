import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickets_app/constants/app_constants.dart';
import 'package:tickets_app/domain/datasource/profile_datasource.dart';
import 'package:tickets_app/domain/model/profile.dart';

class ProfileApiDatasource extends ProfileDatasource {
  @override
  Future<void> createUser(
    String fullName,
    String username,
    String password,
  ) async {
    final url = Uri.https(AppConstants.apiBaseUrl, '/api/users');

    final body = {
      'username': username,
      'fullName': fullName,
      'password': password,
      'profilePicture': '',
      // 'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg',
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception('No results');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<Profile?> fetchProfile(String username) {
    // TODO: implement fetchProfile
    throw UnimplementedError();
  }
}
