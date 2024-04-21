import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    super.key,
    required this.initialIndex,
    required this.onTap,
  });

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: GoogleFonts.jost(
        color: customWhite,
      ),
      onTap: (index) {
        widget.onTap(index);
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
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
    );
  }
}
