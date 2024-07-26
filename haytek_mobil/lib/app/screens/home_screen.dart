import 'package:flutter/material.dart';
import 'package:haytek_mobil/constants/colors.dart';
import 'package:haytek_mobil/models/relay.dart';
import 'package:haytek_mobil/relay_item.dart';
import 'package:haytek_mobil/screens/Account.dart';
import 'package:haytek_mobil/screens/Add_input_screen.dart';
import 'package:haytek_mobil/screens/Login.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final password = 1515;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  List<RelayModel> relays = [
    RelayModel(
        id: 1,
        name: "Tarla Sontaj (Röle 1)",
        type: 0,
        relay: 0,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 2,
        name: "Oturma Odası Klima (Röle 2)",
        type: 0,
        relay: 1,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 3,
        name: "Röle 3",
        type: 0,
        relay: 2,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 4,
        name: "Röle 4",
        type: 0,
        relay: 3,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 5,
        name: "Röle 5",
        type: 0,
        relay: 4,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 6,
        name: "Röle 6",
        type: 0,
        relay: 5,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 7,
        name: "Röle 7",
        type: 0,
        relay: 6,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 8,
        name: "Röle 8",
        type: 0,
        relay: 7,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 9,
        name: "Röle 9",
        type: 0,
        relay: 8,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 10,
        name: "Röle 10",
        type: 0,
        relay: 9,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 11,
        name: "Röle 11",
        type: 0,
        relay: 10,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 12,
        name: "Röle 12",
        type: 0,
        relay: 11,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 13,
        name: "Röle 13",
        type: 0,
        relay: 12,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 14,
        name: "Röle 14",
        type: 0,
        relay: 13,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 15,
        name: "Röle 15",
        type: 0,
        relay: 14,
        pwd: password,
        isActive: false,
        time: 0),
    RelayModel(
        id: 16,
        name: "Röle 16",
        type: 0,
        relay: 15,
        pwd: password,
        isActive: false,
        time: 0),
  ];

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
                          image: AssetImage("lib/assets/images/haytekLogo.png"),
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
