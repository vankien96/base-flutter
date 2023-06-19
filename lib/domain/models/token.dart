class Token {
  final String accessToken;
  final DateTime accessTokenExpireAt;
  final String refreshToken;
  final DateTime refreshTokenExpireAt;

  Token(this.accessToken, this.accessTokenExpireAt, this.refreshToken,
      this.refreshTokenExpireAt);
}
