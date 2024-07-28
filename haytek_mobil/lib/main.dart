import 'package:flutter/material.dart';
import 'package:haytek_mobil/app/Repositories/RelayRepository.dart';
import 'package:haytek_mobil/app/Repositories/UserRepository.dart';
import 'package:haytek_mobil/app/providers/relay_provider.dart';
import 'package:haytek_mobil/app/providers/user_provider.dart';
import 'package:haytek_mobil/app/screens/Auth/Login/Login.dart';
import 'package:haytek_mobil/app/services/database_service.dart';
import 'package:provider/provider.dart';

// Declareted default relays
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initialize();
  await DatabaseService.saveInitialRelayModels();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(UserRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => RelayProvider(RelayRepository()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
