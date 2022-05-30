import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.dart';

import 'page/sign_in_up/sign_in.dart';
import 'package:flutter_app/web/global.dart' as global;

void main() {
  runApp(FlutterApp());
}


class FlutterApp extends StatefulWidget {
  FlutterApp({Key? key}) : super(key: key);

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: global.isConnected ? Home() : Sign_in(),
    );
  }
}
