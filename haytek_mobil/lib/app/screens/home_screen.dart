import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/config/images_path.dart';
import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:haytek_mobil/app/relay_item.dart';
import 'package:haytek_mobil/app/screens/Account.dart';
import 'package:haytek_mobil/app/screens/Add_input_screen.dart';
import 'package:haytek_mobil/app/screens/Login.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final password = 1515;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  List<RelayModel> relays = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor(appBar_backgroundColor),
          //automaticallyImplyLeading: false,
          title: const Text(
            'Haytek Cihaz Yönetim',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            tabs: const [
              Tab(text: "Girişler", icon: Icon(Icons.input)),
              Tab(text: "Çıkışlar", icon: Icon(Icons.output)),
            ],
          ),
        ),
        drawer: _drawerMenu(deviceWidth, deviceHeight, context),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("İnputs device is here")),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: relays.length,
              itemBuilder: (context, index) {
                return RelayItem(relayModel: relays[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

// Hamburger menü ve içeriği burada duruyor
  Drawer _drawerMenu(
      double deviceWidth, double deviceHeight, BuildContext context) {
    return Drawer(
      // Drawer widget'i burada kullanılarak hamburger menü ekleniyor
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
                          fit: BoxFit
                              .cover, // resim container alanına tam oturcak
                        ),
                        color: Color.fromARGB(255, 227, 226, 226),
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(8))),
                    width: deviceWidth, // Tel ekranı genişliği kadar
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
}
