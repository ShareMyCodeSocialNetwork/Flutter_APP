import 'package:flutter/material.dart';

import 'home/news.dart';
import 'home/projects.dart';
import 'home/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: true,//boutton retour sur lappbar
      ),
      body: currentIndex == 0
          ? News()
          : currentIndex == 1
              ? Search()
              : Projects(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
            label: 'News',
            icon: Icon(
              Icons.newspaper,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Group',
            icon: Icon(
              Icons.group,
              size: 20,
            ),
          ), /*BottomNavigationBarItem(
                label: 'Group',
                icon: Icon(Icons.group,size: 20,)
            ),*/
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
