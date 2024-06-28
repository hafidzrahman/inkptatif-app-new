// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_drawer.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/dashboard.dart';
import 'package:inkptatif/pages/input_nilai_list.dart';
import 'package:inkptatif/utils/storage.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  // int _selectedIndex = 0;

  List<Widget> widgetList = [
    Dashboard(),
    InputNilaiList(
      kategori: 'kp',
    ),
    InputNilaiList(kategori: 'ta'),
  ];

  void _onItemTapped(int index) {
    ref.read(indexBottomNavBarNotifierProvider.notifier).setIndex(index);
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = ref.watch(indexBottomNavBarNotifierProvider);
    return Scaffold(
        appBar: MyAppBar(elevation: 4),
        drawer: MyDrawer(
          onLogoutPressed: () => {Navigator.of(context).pushNamed('/')},
        ),
        body: Center(
          child: widgetList[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: GoogleFonts.jost(
            color: customWhite,
          ),
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: secondary,
          unselectedItemColor: customWhite,
          selectedLabelStyle: GoogleFonts.jost(color: customWhite),
          backgroundColor: primary,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.switch_account_rounded),
              label: 'Input Nilai KP',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Input Nilai TA',
            ),
          ],
        ));
  }
}
