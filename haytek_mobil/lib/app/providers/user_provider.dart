import 'package:flutter/foundation.dart';
import 'package:haytek_mobil/app/Repositories/UserRepository.dart';
import 'package:haytek_mobil/app/models/user_model.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository;

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  UserProvider(this._userRepository) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      _users = await _userRepository.getAll();
      notifyListeners();
    } catch (e) {
      // Hata mesajını konsola yazdır
      debugPrint('Error fetching users: $e');
    }
  }

  Future<void> addUser(UserModel user) async {
    await _userRepository.add(user);
    fetchUsers();
  }
}
