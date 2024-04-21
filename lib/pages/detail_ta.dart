// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/nilai_bimbingan_ta.dart';
import 'package:inkptatif/pages/nilai_sidang_ta.dart';

class DetailTA extends StatelessWidget {
  final String nama;
  final String nim;
  final String foto;
  final String kategori;

  const DetailTA({
    super.key,
    required this.nama,
    required this.foto,
    required this.nim,
    required this.kategori,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 625,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 76,
                      backgroundColor: secondary,
                      child: CircleAvatar(
                        radius: 72,
                        backgroundImage: AssetImage(foto),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      nama,
                      style: GoogleFonts.jost(
                        fontSize: 28,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      nim,
                      style: GoogleFonts.jost(
                        fontSize: 20,
                        color: secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Pembimbing 1:',
                      style: GoogleFonts.jost(
                        fontSize: 24,
                        color: secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Bu Fulanah',
                      style: GoogleFonts.jost(
                        fontSize: 24,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Pembimbing 2:',
                      style: GoogleFonts.jost(
                        fontSize: 24,
                        color: secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Pak Fulan',
                      style: GoogleFonts.jost(
                        fontSize: 24,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Judul:',
                      style: GoogleFonts.jost(
                        fontSize: 24,
                        color: secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Perancangan Sebuah Rancangan yang Akan Dirancangkan',
                      style: GoogleFonts.jost(
                        fontSize: 24,
                        color: primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Pada',
                      style: GoogleFonts.jost(
                        fontSize: 16,
                        color: secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '30 Desember 2026 - FST.303',
                      style: GoogleFonts.jost(
                        fontSize: 12,
                        color: primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: MyButton(backgroundBtn: customGreen, text: '90'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: MyButton(
                      backgroundBtn: secondary,
                      text: 'Edit',
                      onTap: () {
                        if (kategori == 'dibimbing') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NilaiBimbinganTA(
                                        nama: nama,
                                        kategori: kategori,
                                        foto: foto,
                                        nim: nim,
                                      )));
                        } else if (kategori == 'diuji') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NilaiSidangTA(
                                        nama: nama,
                                        kategori: kategori,
                                        foto: foto,
                                        nim: nim,
                                      )));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
