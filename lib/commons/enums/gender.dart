import 'package:hive/hive.dart';

part 'gender.g.dart';

@HiveType(typeId: 0)
enum Gender {
  @HiveField(0)
  male,

  @HiveField(1)
  female,

  @HiveField(2)
  other
}
