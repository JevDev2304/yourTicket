import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/profile_repository.dart';
import 'package:tickets_app/provider/repository_provider.dart';

class AuthController extends AsyncNotifier<void> {
  late final ProfileRepository profileRepository;

  // AuthController(this.profileRepository) : super();
  @override
  FutureOr<void> build() {
    profileRepository = ref.watch(profileApiRepositoryProvider);
  }

  Future<void> createUser(fullName, username, password) async {
    state = const AsyncLoading();
    try {
      await profileRepository.createUser(fullName, username, password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
