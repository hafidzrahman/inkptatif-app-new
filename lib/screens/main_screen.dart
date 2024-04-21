// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_drawer.dart';
import 'package:inkptatif/components/my_bottomnavigationbar.dart';
import 'package:inkptatif/pages/dashboard.dart';
import 'package:inkptatif/pages/input_nilai_kp.dart';
import 'package:inkptatif/pages/input_nilai_ta.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> widgetList = const [
    Dashboard(),
    InputNilaiKP(),
    InputNilaiTA(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(elevation: 4),
      drawer: MyDrawer(
        onLogoutPressed: () => {},
      ),
      body: Center(
        child: widgetList[_selectedIndex],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        initialIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
