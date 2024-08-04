const String domain = "http://192.168.7.1";

// Bu url ile cihazın outputlarına erişilebilir
const String getRelaysUrl = "$domain/relay_cgi_load.cgi";
final setRelaysUrl = Uri.parse('$domain/relay_cgi.cgi');

// Input değerleri hakkında bilgi alınabilir
const String getInputUrl = "$domain/input.cgi";

// :GET ==> Cihazın tüm verileri çekiliyor
const String getdeviceInfoUrl = "$domain/api/v2/config.cgi";

//: POST ==> Cihaz upload
const String setdeviceInfoUrl = "$domain/api/v2/mfr_info.cgi ";

const String setDeviceTaskUrl = "$domain/api/v2/mfr_info.cgi ";

const String determineTask =
    "$domain/task_set.cgi";// POST  Haftanın belirli günleri kullanılması için planlama