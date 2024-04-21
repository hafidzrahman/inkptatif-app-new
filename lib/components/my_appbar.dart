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
      backgroundColor: primary,
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
            const TextSpan(
              text: "InKPTA",
            ),
            TextSpan(
              text: "TIF",
              style: TextStyle(
                color: secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
