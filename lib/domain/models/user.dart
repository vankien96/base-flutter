import 'package:base/commons/enums/gender.dart';
import 'package:base/domain/models/token.dart';

class User {
  String id;
  String name;
  Gender gender;
  DateTime? birthday;
  Token userToken;

  User(this.id, this.name, this.gender, this.userToken, {this.birthday});
}
