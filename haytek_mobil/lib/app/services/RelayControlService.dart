import 'package:http/http.dart' as http;

class RelayControlService {
  final url = Uri.parse('http://192.168.7.1:80/relay_cgi.cgi');




  Future<void> sendRequest(int cardIndex, bool switchValue) async {
   
    // URL'yi ve parametreleri burada oluşturun
   
    final params = {
      'type': '0',
      'relay': cardIndex.toString(), // relay değerini kartın sırasına göre ayarla (1'den başlar)
      'on': switchValue ? '1' : '0', // Switch durumuna göre 'on' değerini ayarla
      'time': '0',
      'pwd': '1515',
    };

    try {
      // HTTP isteğini gönder
      final response = await http.get(url.replace(queryParameters: params));

      // Yanıtı kontrol et (isteğin başarıyla gönderilip gönderilmediği)
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
}
