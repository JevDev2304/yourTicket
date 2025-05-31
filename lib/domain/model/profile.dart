class Profile {
  final String fullName;
  final String username;

  Profile({required this.fullName, required this.username});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(fullName: json['fullName'], username: json['username']);
  }
}
