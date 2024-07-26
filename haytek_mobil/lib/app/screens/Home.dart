import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/constants/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Fixed Tabs'),
            automaticallyImplyLeading: false,
            backgroundColor: HexColor(appBar_backgroundColor),
            bottom: const TabBar(
              labelStyle: TextStyle(color: Colors.white),
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    text: 'Girişler',
                    icon: Icon(Icons.input, color: Colors.white)),
                Tab(
                    text: 'Çıkışlar',
                    icon: Icon(Icons.output, color: Colors.white)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('DOGS')),
              Center(child: Text('CATS')),
              Center(child: Text('BIRDS')),
            ],
          ),
        ),
      ),
    );
  }
}
