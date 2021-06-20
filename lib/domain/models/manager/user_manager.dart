import 'package:base/commons/const/hive_key.dart';
import 'package:base/data/local/app_local_store.dart';
import 'package:base/domain/models/user.dart';

class UserManager {
  AppLocalStore localStore;

  UserManager(this.localStore);

  bool get isLogin => getUser() != null;

  void saveUser(User user) async {
    final secureBox = localStore.secureBox;
    secureBox.put(HiveKey.user, user);
  }

  User? getUser() {
    final secureBox = localStore.secureBox;
    final user = secureBox.get(HiveKey.user);
    if (user is User) {
      return user;
    }
    return null;
  }
}
