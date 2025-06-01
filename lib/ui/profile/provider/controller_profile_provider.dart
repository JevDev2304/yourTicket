import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/provider/repository_provider.dart';
import 'package:tickets_app/ui/profile/controller/profile_controller.dart';
import 'package:tickets_app/ui/profile/controller/profile_state.dart';

final profileControllerProvider =
    StateNotifierProvider.family<ProfileController, ProfileState, String>((
      ref,
      email,
    ) {
      final profileRepository = ref.watch(profileApiRepositoryProvider);
      final profileDetailController = ProfileController(profileRepository);
      return profileDetailController..getProfile(email);
    });
