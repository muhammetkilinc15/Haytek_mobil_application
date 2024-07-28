import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/config/images_path.dart';
import 'package:haytek_mobil/app/screens/Account.dart';
import 'package:haytek_mobil/app/screens/Add_input_screen.dart';
import 'package:haytek_mobil/app/screens/Auth/Login/Login.dart';
import 'package:hexcolor/hexcolor.dart';

Drawer hambugerMenu(
    double deviceWidth, double deviceHeight, BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: HexColor(appBar_backgroundColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Menü',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(hamburgerMenu),
                        fit: BoxFit.cover,
                      ),
                      color: Color.fromARGB(255, 227, 226, 226),
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(8))),
                  width: deviceWidth,
                  height: deviceHeight,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.person),
              Text('Hesabım'),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MyAccountScreenState(),
            ));
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.devices_other),
              Text(' Girişe cihaz ekle '),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddInputDevice()));
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.add_card),
              Text(' Cıkısa cihaz ekle'),
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.info_outline),
              Text(" Cihaz Hakkında Bilgiler"),
            ],
          ),
          onTap: () => (),
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.exit_to_app),
              Text(' Çıkış'),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Login(),
            ));
          },
        ),
      ],
    ),
  );
}
