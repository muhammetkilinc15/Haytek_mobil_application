import 'package:isar/isar.dart';

abstract class IRepository<T> {
  Future<void> add(T entity);
  Future<List<T>> getAll();
  Future<T?> getById(Id id);
  Future<void> update(T entity);
  Future<void> delete(Id id);
}
