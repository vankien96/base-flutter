import 'package:base/domain/models/user.dart';
import 'package:base/domain/repositories/user_repository.dart';
import 'package:base/domain/usecases/authentication_usecase.dart';

class AuthUsecaseData implements AuthUsecase {
  AuthUsecaseData(this.userRepository);

  UserRepository userRepository;

  @override
  Future<User> loginWithCredential(String username, String password) {
    return userRepository.loginWithCredential(username, password);
  }
}
