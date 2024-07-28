import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:haytek_mobil/app/models/user_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late Isar isar;

  // Isar starting
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([RelayModelSchema, UserModelSchema],
        directory: dir.path);
  }

  static Future<void> saveInitialRelayModels() async {
    bool isEmpty = await isDatabaseEmpty();
    if (isEmpty) {
      final initialRelayModels = <RelayModel>[];
      for (int i = 0; i < 16; i++) {
        initialRelayModels.add(RelayModel()
          ..title = "Röle ${i + 1}"
          ..relay = i);
      }
      await isar.writeTxn(() async {
        await isar.relayModels.putAll(initialRelayModels);
      });
    }
  }

  static Future<bool> isDatabaseEmpty() async {
    final relays = await isar.relayModels.where().findAll();
    return relays.isEmpty;
  }
}
