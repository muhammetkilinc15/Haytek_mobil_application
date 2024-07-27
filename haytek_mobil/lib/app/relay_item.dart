import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/config/colors.dart';
import 'package:haytek_mobil/app/models/relay_model.dart';
import 'package:haytek_mobil/app/screens/RelayTask.dart';
import 'package:haytek_mobil/app/screens/home_screen.dart';
import 'package:haytek_mobil/app/services/RelayControlService.dart';
import 'package:hexcolor/hexcolor.dart';

class RelayItem extends StatefulWidget {
  const RelayItem({super.key, required this.relayModel});
  final RelayModel relayModel;

  @override
  State<RelayItem> createState() => _RelayItemState();
}

class _RelayItemState extends State<RelayItem> {
  RelayControlService relayservice = RelayControlService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              size: 40,
              widget.relayModel.isActive
                  ? Icons.light_mode_sharp
                  : Icons.lightbulb,
              color: widget.relayModel.isActive
                  ? Colors.green
                  : Color.fromARGB(255, 188, 13, 0),
            ),
            title: Text(widget.relayModel.name!),
            subtitle: Text(widget.relayModel.isActive ? 'Çalışıyor' : 'Pasif',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 15,
                    fontWeight: widget.relayModel.isActive
                        ? FontWeight.bold
                        : FontWeight.normal)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Cihazı Aç/Kapa"),
              _PopupMenuMethod(context),
              _switchMethod(),
            ],
          ),
        ],
      ),
    ));
  }

  Switch _switchMethod() {
    return Switch(
      activeColor: HexColor(appBar_backgroundColor),
      value: widget.relayModel.isActive,
      onChanged: (value) {
        setState(() {
          widget.relayModel.isActive = value;
          relayservice.sendRequest(
              widget.relayModel.relay!, widget.relayModel.isActive);
        });
      },
    );
  }

  PopupMenuButton<int> _PopupMenuMethod(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(
        Icons.edit_note_sharp,
        size: 30,
      ),
      onSelected: (int value) {
        switch (value) {
          case 1:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
          case 2:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RelayTask()),
            );
            break;
          case 3:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.add),
            title: Text('Yeniden Adlandır'),
          ),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.lock_clock),
            title: Text('Zaman Programla'),
          ),
        ),
        const PopupMenuItem<int>(
          value: 3,
          child: ListTile(
            leading: Icon(Icons.article),
            title: Text('Item 3'),
          ),
        ),
      ],
    );
  }
}
