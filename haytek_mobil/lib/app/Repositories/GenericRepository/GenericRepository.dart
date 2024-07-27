import 'package:haytek_mobil/app/Repositories/GenericRepository/IGenericRepository.dart';
import 'package:haytek_mobil/app/services/Context/database_service.dart';
import 'package:isar/isar.dart';

class Repository<T> implements IRepository<T> {
  final IsarCollection<T> _collection;

  Repository(this._collection);

  @override
  Future<void> add(T entity) async {
    await DatabaseService.isar.writeTxn(() async {
      await _collection.put(entity);
    });
  }

  @override
  Future<List<T>> getAll() async {
    return await _collection.where().findAll();
  }

  @override
  Future<T?> getById(Id id) async {
    return await _collection.get(id);
  }

  @override
  Future<void> update(T entity) async {
    await DatabaseService.isar.writeTxn(() async {
      await _collection.put(entity);
    });
  }

  @override
  Future<void> delete(Id id) async {
    await DatabaseService.isar.writeTxn(() async {
      await _collection.delete(id);
    });
  }
}
