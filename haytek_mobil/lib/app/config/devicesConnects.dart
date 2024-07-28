const String domain = "http://192.168.7.1";

// Bu url ile cihazın outputlarına erişilebilir
const String getRelaysUrl = "$domain/relay_cgi_load.cgi";
final setRelaysUrl = Uri.parse('$domain/relay_cgi.cgi');

// Input değerleri hakkında bilgi alınabilir
const String getInputUrl = "http://192.168.7.1/input.cgi";

// :GET ==> Cihazın tüm verileri çekiliyor
const String getdeviceInfoUrl = "http://192.168.7.1/api/v2/config.cgi";

//: POST ==> Cihaz upload
const String setdeviceInfoUrl = "http://192.168.7.1/api/v2/mfr_info.cgi ";

const String setDeviceTaskUrl = "http://192.168.7.1/api/v2/mfr_info.cgi "; 
//http://192.168.7.1/task_set.cgi : POST // Haftanın belirli günleri kullanılması için planlama