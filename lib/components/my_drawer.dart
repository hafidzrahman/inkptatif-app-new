// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';

class MyDrawer extends StatelessWidget {
  final Function() onLogoutPressed;

  const MyDrawer({
    super.key,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // Sesuaikan dengan kebutuhan
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: primary, // Sesuaikan dengan kebutuhan
            ),
            child: Text(
              'Menu',
              style: GoogleFonts.jost(
                  color: customWhite, // Sesuaikan dengan kebutuhan
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            iconColor: secondary,
            title: Text(
              'Logout',
              style: GoogleFonts.jost(
                color: primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: onLogoutPressed,
          ),
        ],
      ),
    );
  }
}
