class AuthUserEntity {
  const AuthUserEntity({
    required this.token,
    required this.userId,
    required this.fullName,
    required this.email,
    this.mobile,
  });
  final String token;
  final int userId;
  final String fullName;
  final String email;
  final String? mobile;
}
