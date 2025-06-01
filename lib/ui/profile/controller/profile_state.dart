import 'package:tickets_app/domain/model/profile.dart';

class ProfileState {
  final Profile? profile;
  final bool isLoading;
  final String? errorMessage;

  ProfileState({this.profile, this.isLoading = false, this.errorMessage});

  ProfileState copyWith({
    Profile? profile,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
