import 'package:hive/hive.dart';

part 'user_info.g.dart';

@HiveType(typeId: 0)
class UserInfo extends HiveObject {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? imagePath;
  @HiveField(2)
  int? numTaskLeft;
  @HiveField(3)
  int? numTaskDone;
}
