import 'package:hive/hive.dart';

part 'token.g.dart';

@HiveType(typeId: 2)
class Token {
  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final DateTime accessTokenExpireAt;

  @HiveField(2)
  final String refreshToken;

  @HiveField(3)
  final DateTime refreshTokenExpireAt;

  Token(this.accessToken, this.accessTokenExpireAt, this.refreshToken,
      this.refreshTokenExpireAt);
}
