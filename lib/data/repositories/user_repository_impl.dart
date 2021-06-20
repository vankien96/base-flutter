import 'package:base/commons/enums/gender.dart';
import 'package:base/core/api/api_config.dart';
import 'package:base/core/networking/http_client.dart';
import 'package:base/core/networking/http_method.dart';
import 'package:base/domain/models/token.dart';
import 'package:base/domain/models/user.dart';
import 'package:base/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.dioClient);

  DioClient dioClient;

  @override
  Future<User> loginWithCredential(String username, String password) async {
    // Fake request
    await Future.delayed(Duration(seconds: 3));
    var token =
        Token("dsadsadsa", DateTime.now(), "dsadsads adsa", DateTime.now());
    return User("id", "Truong Van Kien", Gender.male, token);
  }
}
