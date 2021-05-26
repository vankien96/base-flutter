import 'package:base/data/models/user.dart';

abstract class AuthUsecase {
  Future<User> loginWithCredential(String username, String password);
}
