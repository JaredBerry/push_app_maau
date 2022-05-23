import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:push_app_maau/provider/push_notifications_service.dart';
import 'package:push_app_maau/src/pages/home_page.dart';
import 'package:push_app_maau/src/pages/mensajes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationProvider.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    //context!
    PushNotificationProvider.messagesStream.listen((message) {
      print('Myapp: $message');

      navigatorKey.currentState?.pushNamed('mensaje', arguments: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App maau',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext c) => HomePage(),
        'mensaje': (BuildContext c) => MensajePage(),
      },
    );
  }
}
