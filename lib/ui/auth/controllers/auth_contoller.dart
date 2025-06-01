import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/data/repository/auth_repository.dart';
import 'package:tickets_app/domain/repository/profile_repository.dart';
import 'package:tickets_app/provider/repository_provider.dart';

class AuthController extends AsyncNotifier<void> {
  late final ProfileRepository profileRepository;
  late final AuthRepository authRepository;

  // AuthController(this.profileRepository) : super();
  @override
  FutureOr<void> build() {
    profileRepository = ref.watch(profileApiRepositoryProvider);
    authRepository = ref.watch(authRepositoryProvider);
  }

  Future<void> createUser(fullName, email, password) async {
    state = const AsyncLoading();
    try {
      await authRepository.signup(email, password);
      await profileRepository.createUser(fullName, email, password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> login(email, password) async {
    state = const AsyncLoading();
    try {
      await authRepository.login(email, password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      await authRepository.logout();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
