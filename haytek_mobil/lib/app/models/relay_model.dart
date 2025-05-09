import 'package:isar/isar.dart';
part 'relay_model.g.dart';

@collection
class RelayModel {
  Id id = Isar.autoIncrement; // Auto Increment
  int? type = 0;
  String? name = ""; // Röle 1-2... diye hep duracak
  String? title; // anabaslık
  int? relay;
  bool isActive = false;
  int? time = 0;
}
