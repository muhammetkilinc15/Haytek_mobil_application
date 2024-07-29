import 'package:flutter/foundation.dart';
import 'package:haytek_mobil/app/Repositories/DeviceRepository.dart';
import 'package:haytek_mobil/app/models/device_model.dart';

class DeviceProvider with ChangeNotifier {
  final DeviceRepository _deviceRepository;

  List<DeviceModel> _users = [];
  List<DeviceModel> get users => _users;

  DeviceProvider(this._deviceRepository) {
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    try {
      _users = await _deviceRepository.getAll();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }
  }

  Future<void> addDevice(DeviceModel device) async {
    try {
      await _deviceRepository.add(device);
      fetchDevices();
    } catch (e) {
      debugPrint("error adding user");
    }
  }
}
