import 'package:flutter/material.dart';
import 'package:haytek_mobil/constants/colors.dart';
import 'package:haytek_mobil/screens/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class AddInputDevice extends StatefulWidget {
  const AddInputDevice({super.key});

  @override
  State<AddInputDevice> createState() => _AddInputDeviceState();
}

class _AddInputDeviceState extends State<AddInputDevice> {
  @override
  Widget build(BuildContext context) {
    String? _selectedValue;
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    IconButton(
                        onPressed: () => (Navigator.pop(context)),
                        icon: Icon(
                          Icons.arrow_back,
                          color: HexColor(buttomColor),
                          size: 30,
                        )),
                  ]),
                  const SizedBox(height: 40),
                  const Text("Girişlere Yeni Bir Cihaz Ekle",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  // Text("Create a new  account",
                  //     style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.grey[400])),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
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
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: DropdownButtonFormField<String>(
                      value: _selectedValue,
                      hint: Text('Bir röle seçin'),
                      items: ["Röle 1", "Röle 2"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Future.delayed(Duration(milliseconds: 70), () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Column(children: [
                                      Icon(
                                        Icons.warning_amber_outlined,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Uyarı'),
                                    ]),
                                    content: const Text(
                                        'Bu cihazı eklemek istediğinize emin misiniz ?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('İptal'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Tamam'),
                                        onPressed: () {
                                          // Tamam butonuna basıldığında yapılacak işlemler buraya yazılır.
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen()));
                                        },
                                      ),
                                    ],
                                  ));
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          HexColor(buttomColor), // Buton
                        ),
                      ),
                      child: const Text(
                        'Cihazı Ekle',
                        style:
                            TextStyle(color: Colors.white), // Yazı rengi beyaz
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
