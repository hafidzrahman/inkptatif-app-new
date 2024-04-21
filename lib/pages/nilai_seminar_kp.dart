// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/components/my_input_textfield.dart';
import 'package:inkptatif/global.dart';
import 'package:google_fonts/google_fonts.dart';

class NilaiSeminarKP extends StatefulWidget {
  final String nama;
  final String nim;
  final String foto;
  final String kategori;

  const NilaiSeminarKP({
    super.key,
    required this.nama,
    required this.foto,
    required this.nim,
    required this.kategori,
  });

  @override
  State<NilaiSeminarKP> createState() => _NilaiSeminarKPState();
}

class _NilaiSeminarKPState extends State<NilaiSeminarKP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 64,
                  width: 64,
                  child: CircleAvatar(
                    radius: 76,
                    backgroundColor: secondary,
                    child: CircleAvatar(
                      radius: 72,
                      backgroundImage: AssetImage(widget.foto),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style: GoogleFonts.jost(
                        fontSize: 28,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.nim,
                      style: GoogleFonts.jost(
                        fontSize: 20,
                        color: secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 24,
              decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(color: primary, width: 4)),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Nilai Seminar KP',
              style: GoogleFonts.jost(
                fontSize: 32,
                color: secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyInputTextField(teks: 'Sikap (20%)'),
                    MyInputTextField(teks: 'Penguasaan Materi (40%)'),
                    MyInputTextField(teks: 'Isi Laporan (40%)'),
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
                    child: MyButton(backgroundBtn: secondary, text: 'Simpan'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: MyButton(
                      backgroundBtn: customRed,
                      text: 'Batal',
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
