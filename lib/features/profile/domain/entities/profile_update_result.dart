class ProfileUpdateResult {
  final String id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? accessToken;

  const ProfileUpdateResult({
    required this.id,
    this.name,
    this.email,
    this.profileImage,
    this.accessToken,
  });
}
