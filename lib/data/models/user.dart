import 'package:base/commons/enums/gender.dart';
import 'package:base/data/models/token.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  Gender gender;

  @HiveField(3)
  DateTime? birthday;

  @HiveField(4)
  Token userToken;

  User(this.id, this.name, this.gender, this.userToken, {this.birthday});
}
