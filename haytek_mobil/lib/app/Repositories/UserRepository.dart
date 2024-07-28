import 'package:haytek_mobil/app/Repositories/GenericRepository/GenericRepository.dart';
import 'package:haytek_mobil/app/models/user_model.dart';
import 'package:haytek_mobil/app/services/database_service.dart';

class UserRepository extends Repository<UserModel> {
  UserRepository() : super(DatabaseService.isar.userModels);
}
