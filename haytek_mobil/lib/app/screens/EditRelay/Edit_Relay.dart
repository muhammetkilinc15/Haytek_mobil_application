import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:provider/provider.dart';
import 'package:haytek_mobil/app/providers/relay_provider.dart';

class EditRelay extends StatefulWidget {
  final RelayModel relayModel;
  const EditRelay({super.key, required this.relayModel});

  @override
  State<EditRelay> createState() => _EditRelayState();
}

class _EditRelayState extends State<EditRelay> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.relayModel.name);
    _titleController = TextEditingController(text: widget.relayModel.title);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    super.dispose();
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: HexColor(appBar_backgroundColor),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Röle Düzenle",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Röle ayarlarını güncelle",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.info_rounded,
                              size: 30,
                            ),
                            labelText: "Röle Adı",
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen röle adını girin';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _titleController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.mail,
                              size: 30,
                            ),
                            labelText: "Başlık",
                            labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen başlık girin';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _updateRelay();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      child: const Text(
                        'Röleyi Güncelle',
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

  Future<void> _updateRelay() async {
    // RelayProvider'ı kullanarak güncelleme işlemini yapın
    final relayProvider = Provider.of<RelayProvider>(context, listen: false);

    // Güncellenmiş verileri al
    final updatedRelay = widget.relayModel
      ..name = _nameController.text
      ..title = _titleController.text;

    // RelayProvider üzerinden güncelleme işlemi
    await relayProvider.updateRelay(updatedRelay);

    // Güncelleme sonrası dönüş işlemleri
    Navigator.of(context).pop(); // Güncelleme işlemi tamamlandığında geri dön
  }
}
