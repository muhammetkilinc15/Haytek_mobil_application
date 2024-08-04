import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/providers/relay_provider.dart';
import 'package:provider/provider.dart';
import 'package:haytek_mobil/app/providers/device_provider.dart';
import 'package:haytek_mobil/app/screens/home/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:haytek_mobil/app/models/device_model.dart';

class AddInputDevice extends StatefulWidget {
  const AddInputDevice({super.key});

  @override
  State<AddInputDevice> createState() => _AddInputDeviceState();
}

class _AddInputDeviceState extends State<AddInputDevice> {
  TextEditingController d_name_controller = TextEditingController();
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: HexColor(buttomColor),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Girişlere Yeni Bir Cihaz Ekle",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: TextFormField(
                      controller: d_name_controller,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.design_services,
                          size: 30,
                        ),
                        labelText: "Cihaz adı",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<RelayProvider>(
                    builder: (context, relayProvider, child) {
                      return Container(
                        child: DropdownButtonFormField<String>(
                          value: _selectedValue,
                          hint: Text('Bir röle seçin'),
                          items: relayProvider.relays
                              .map<DropdownMenuItem<String>>((relay) {
                            return DropdownMenuItem<String>(
                              value: relay.id.toString(),
                              child: Text(relay.title ?? 'Bilinmeyen Röle'),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (_selectedValue == null ||
                            d_name_controller.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Uyarı'),
                              content:
                                  const Text('Lütfen tüm alanları doldurun.'),
                              actions: [
                                TextButton(
                                  child: const Text('Tamam'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        Future.delayed(Duration(milliseconds: 70), () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Column(
                                children: [
                                  Icon(
                                    Icons.warning_amber_outlined,
                                    size: 50,
                                  ),
                                  SizedBox(height: 10),
                                  Text('Uyarı'),
                                ],
                              ),
                              content: const Text(
                                'Bu cihazı eklemek istediğinize emin misiniz?',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('İptal'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Tamam'),
                                  onPressed: () async {
                                    final newDevice = DeviceModel()
                                      ..name = d_name_controller.text
                                      ..relayId = int.parse(_selectedValue!);

                                    try {
                                      await Provider.of<DeviceProvider>(context,
                                              listen: false)
                                          .addDevice(newDevice);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    } catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Hata'),
                                          content: const Text(
                                              'Cihaz eklenirken bir hata oluştu.'),
                                          actions: [
                                            TextButton(
                                              child: const Text('Tamam'),
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          HexColor(buttomColor),
                        ),
                      ),
                      child: const Text(
                        'Cihazı Ekle',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
