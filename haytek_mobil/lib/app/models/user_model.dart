import 'package:isar/isar.dart';
part 'user_model.g.dart';

@collection
class UserModel {
  Id id = Isar.autoIncrement; // Auto Increment
  String? name;
  String? email;
  String? phone;
  String? password;
}
