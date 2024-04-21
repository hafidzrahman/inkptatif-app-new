// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inkptatif/global.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHistoryCard extends StatelessWidget {
  const MyHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(color: secondary, width: 2),
          color: customWhite,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                ClipPath(
                  clipper: AvatarClipper(),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                ),
                Positioned(
                  left: 11,
                  top: 50,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/img/profile.png"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhammad Faruq',
                            style: GoogleFonts.jost(
                                color: customWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '12250111791',
                            style: GoogleFonts.jost(
                                color: primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul:',
                    style: GoogleFonts.jost(
                        fontSize: 20,
                        color: primary,
                        fontWeight: FontWeight.bold)),
                Text(
                    'Perancangan Rancangan Sebuah Rancangkan yang Akan Dirancangkan Dengan Metode yang Paling Sesuai',
                    style: GoogleFonts.jost(
                      color: primary,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text('Kamis, 31 Desember 2026',
                        style: GoogleFonts.jost(
                          color: secondary,
                          fontSize: 12,
                        )),
                    Spacer(flex: 1),
                    Text('10.30 - 12.00/FST.303',
                        style: GoogleFonts.jost(
                          color: secondary,
                          fontSize: 12,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(8, size.height)
      ..arcToPoint(Offset(114, size.height), radius: Radius.circular(20))
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
