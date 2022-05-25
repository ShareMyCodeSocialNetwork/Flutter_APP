import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S\'enregistrer'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,//boutton retour sur lappbar
      ),
    );
  }
}
