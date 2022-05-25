import 'package:flutter/material.dart';

import 'page/sign_in_up/sign_in.dart';


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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sign_in(),
    );
  }
}
