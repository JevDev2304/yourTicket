import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickets_app/domain/repository/profile_repository.dart';
import 'package:tickets_app/ui/profile/controller/profile_state.dart';

class ProfileController extends StateNotifier<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileController(this.profileRepository) : super(ProfileState());

  // Future<void> initialize() async {
  //   await getTicketDetail();
  // }

  Future<void> getProfile(String email) async {
    state = state.copyWith(isLoading: true);
    try {
      final profile = await profileRepository.getProfile(email);
      state = state.copyWith(isLoading: false, profile: profile);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}
