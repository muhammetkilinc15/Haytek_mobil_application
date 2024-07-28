import 'package:flutter/foundation.dart';
import 'package:haytek_mobil/app/Repositories/RelayRepository.dart';
import 'package:haytek_mobil/app/models/relay_model.dart';

class RelayProvider with ChangeNotifier {
  final RelayRepository _relayRepository;

  List<RelayModel> _relays = [];
  List<RelayModel> get relays => _relays;

  RelayProvider(this._relayRepository) {
    fetchRelays();
  }

  Future<void> fetchRelays() async {
    _relays = await _relayRepository.getAll();
    notifyListeners();
  }

  // Hata oldugu için getAll yaptım
  Future<void> fetchActiveRelays() async {
    _relays = await _relayRepository.getAll();
    notifyListeners();
  }

  Future<void> addRelay(RelayModel relay) async {
    await _relayRepository.add(relay);
    fetchRelays();
  }

  Future<void> updateRelay(RelayModel relay) async {
    await _relayRepository.update(relay);
    fetchRelays();
  }

  // Relay'leri güncellemek için yeni bir metod ekleyin
  void updateRelays(List<RelayModel> updatedRelays) {
    _relays = updatedRelays;
    notifyListeners();
  }
}
