import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje Page'),
      ),
      body: Center(
        child: Text(arg.toString()),
      ),
    );
  }
}
