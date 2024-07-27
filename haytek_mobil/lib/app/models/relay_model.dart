import 'package:isar/isar.dart';
part 'relay_model.g.dart';

@collection
class RelayModel {
  Id id = Isar.autoIncrement; // Auto Increment
  int? type;
  String? name;
  int? relay;
  bool isActive = false;
  int? time;
}
