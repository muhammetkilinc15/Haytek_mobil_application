import 'package:isar/isar.dart';
part 'device_model.g.dart';

@collection
class DeviceModel {
  Id id = Isar.autoIncrement; // Auto Increment
  String? name = ""; // Röle 1-2... diye hep duracak
  int? relayId; // RelayModel'in kimliğini saklayacak
}
