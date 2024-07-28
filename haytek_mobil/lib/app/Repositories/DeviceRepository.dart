import 'package:haytek_mobil/app/Repositories/GenericRepository/GenericRepository.dart';
import 'package:haytek_mobil/app/models/device_model.dart';
import 'package:haytek_mobil/app/services/database_service.dart';

class DeviceRepository extends Repository<DeviceModel> {
  DeviceRepository() : super(DatabaseService.isar.deviceModels);
}
