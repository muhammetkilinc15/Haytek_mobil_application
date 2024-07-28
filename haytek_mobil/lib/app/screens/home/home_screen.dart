import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/providers/relay_provider.dart';
import 'package:haytek_mobil/app/Widgets/RelayWidgets/relay_item.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:haytek_mobil/app/screens/home/widget/drawerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

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
        drawer: hambugerMenu(deviceWidth, deviceHeight, context),
        body: TabBarView(
          controller: _tabController,
          children: [
            const Center(
                child: Text(
                    "İnputs device is here")), // input içerikleri buraya gelecek

            Consumer<RelayProvider>(
              // output içerikleri buraya gelecek
              builder: (context, relayProvider, child) {
                final relays = relayProvider.relays;
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: relays.length,
                  itemBuilder: (context, index) {
                    return RelayItem(relayModel: relays[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
