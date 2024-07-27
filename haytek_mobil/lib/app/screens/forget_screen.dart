import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/screens/Login.dart';
import 'package:haytek_mobil/app/screens/Register.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Icon(Icons.lock_person, color: Colors.grey[300], size: 95),
                  const SizedBox(height: 13),
                  const Center(
                    child: const Text("Giriş Yaparken Sorun mu Yaşıyorsun ?",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                      "\t\t\t\tE-posta adresini veya kullanıcı adını gir\n\t\t\t\t\t\t\t\thesabına yeniden girebilmen için\n\t\t\t\t\t\t\t\t\t\t\t\tsana yeni şifreni gönderelim",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400])),
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
                            Icons.info_outline_rounded,
                            size: 30,
                          ),
                          labelText: "Email veya kullanıcı adı",
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          HexColor(buttomColor), // Buton rengi
                        ),
                      ),
                      child: const Text(
                        'Giriş Şifresi Gönder',
                        style:
                            TextStyle(color: Colors.white), // Yazı rengi beyaz
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Center(
                          child: Container(
                            color: Colors
                                .white, // Yazının arka plan rengi (isteğe bağlı)
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Text(
                              'YA DA',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ));
                    },
                    child: const Text(
                      'Yeniden Hesap Oluştur',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17), // Yazı rengi beyaz
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
