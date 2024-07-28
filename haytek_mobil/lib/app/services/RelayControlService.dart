import 'package:haytek_mobil/app/Repositories/RelayRepository.dart';
import 'package:haytek_mobil/app/config/devicesConnects.dart';
import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:haytek_mobil/app/providers/relay_provider.dart';
import 'package:http/http.dart' as http;

class RelayControlService {
  RelayProvider relayProvider = RelayProvider(RelayRepository());

  // Bu metot röle süreli açıldı ise kapandığında program başlayınca güncellenebilir
  Future<void> getRelayInfo() async {
    final response = await http.get(Uri.parse(getRelaysUrl));
    if (response.statusCode == 200) {
      String responseBody = response.body;
      List<String> splitData = responseBody.split('&');
      List<RelayModel> updatedRelays = [];
      for (int i = 2; i < splitData.length; i++) {
        bool isActive = splitData[i] == '1';
        RelayModel relay = RelayModel()
          ..relay = i
          ..isActive = isActive; // Örnek id ve isActive kullanımı
        updatedRelays.add(relay);
      }

      // RelayProvider ile veritabanını güncellenir
      relayProvider.updateRelays(updatedRelays);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }
}

Future<void> setRelayInfo(int cardIndex, bool switchValue) async {
  final params = {
    'type': '0',
    'relay': cardIndex.toString(),
    'on': switchValue ? '1' : '0',
    'time': '0',
    'pwd': '1515',
  };

  try {
    final response =
        await http.get(setRelaysUrl.replace(queryParameters: params));

    if (response.statusCode == 200) {
      // Başarılı yanıt alındığında burada işlemler yapabilirsiniz
      print('Kart $cardIndex için istek başarıyla gönderildi.');
    } else {
      print(
          'Kart $cardIndex için istek gönderilirken bir hata oluştu: ${response.statusCode}');
    }
  } catch (e) {
    print('Kart $cardIndex için istek gönderilirken bir hata oluştu: $e');
  }
}
