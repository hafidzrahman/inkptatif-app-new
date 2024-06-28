import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? elevation;
  final PreferredSizeWidget? bottom;

  const MyAppBar({super.key, this.elevation, this.bottom});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: customWhite),
      flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 2, 48, 71),
              Color.fromARGB(255, 33, 158, 188)
            ],
            begin: Alignment.centerLeft,
            end : Alignment.centerRight
            ),
          ),
      ),
      elevation: elevation,
      bottom: bottom,
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.jost(
            fontSize: 24,
            color: customWhite,
            fontWeight: FontWeight.bold,
          ),
          children: [
            
          ],
        ),
      ),
    );
  }
}
