import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:haytek_mobil/app/models/user_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late Isar isar;

  // Isar başlatma
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([RelayModelSchema, UserModelSchema],
        directory: dir.path);
  }
}
