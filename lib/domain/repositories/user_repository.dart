import 'package:base/data/models/user.dart';

abstract class UserRepository {
  Future<User> loginWithCredential(String username, String password);
}
