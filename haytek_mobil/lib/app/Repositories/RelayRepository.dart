import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:haytek_mobil/app/services/database_service.dart';
import 'package:haytek_mobil/app/Repositories/GenericRepository/GenericRepository.dart';
import 'package:isar/isar.dart';

class RelayRepository extends Repository<RelayModel> {
  RelayRepository() : super(DatabaseService.isar.relayModels);

  // Special method
  Future<List<RelayModel?>> getActiveRelays() async {
    return await DatabaseService.isar.relayModels.getAll(List.empty());
  }

  Future<List<RelayModel>> getRelaysByName(String name) async {
    return await DatabaseService.isar.relayModels
        .filter()
        .nameEqualTo(name)
        .findAll();
  }
}
