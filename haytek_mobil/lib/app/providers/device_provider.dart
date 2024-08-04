import 'package:flutter/foundation.dart';
import 'package:haytek_mobil/app/Repositories/DeviceRepository.dart';
import 'package:haytek_mobil/app/models/device_model.dart';

class DeviceProvider with ChangeNotifier {
  final DeviceRepository _deviceRepository;

  List<DeviceModel> _devices = [];
  List<DeviceModel> get devices => _devices;

  DeviceProvider(this._deviceRepository) {
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    try {
      _devices = await _deviceRepository.getAll();
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

  Future<void> removeDevice(DeviceModel device) async {
    try {
      await _deviceRepository.delete(device.id);
      fetchDevices();
    } catch (e) {
      debugPrint("error adding user");
    }
  }
}
