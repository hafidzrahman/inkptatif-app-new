// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/components/my_input_textfield.dart';
import 'package:inkptatif/global.dart';
import 'package:google_fonts/google_fonts.dart';

class NilaiSidangTA extends StatefulWidget {
  final String nama;
  final String nim;
  final String foto;
  final String kategori;

  const NilaiSidangTA({
    super.key,
    required this.nama,
    required this.foto,
    required this.nim,
    required this.kategori,
  });

  @override
  State<NilaiSidangTA> createState() => _NilaiSidangTAState();
}

class _NilaiSidangTAState extends State<NilaiSidangTA> {
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
              'Nilai Sidang TA',
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
                    MyInputTextField(teks: 'Sikap (attittude) presentasi'),
                    MyInputTextField(teks: 'Kemampuan presentasi'),
                    MyInputTextField(teks: 'Penguasaan terhadap materi'),
                    MyInputTextField(
                        teks: 'Urgensi terhadap masalah penelitian'),
                    MyInputTextField(
                        teks: 'Relevansi referensi dengan judul penelitian'),
                    MyInputTextField(
                        teks: 'Urgensi terhadap masalah penelitian'),
                    MyInputTextField(
                        teks:
                            'Kesesuaian metodologi penelitian dengan pembahasan'),
                    MyInputTextField(
                        teks:
                            'Teknik pengumpulan data sesuai standar laporan TA'),
                    MyInputTextField(
                        teks:
                            'Tahapan analisa sesuai dengan standar laporan TA'),
                    MyInputTextField(
                        teks:
                            'Tahapan rancangan sesuai dengan standar laporan TA'),
                    MyInputTextField(
                        teks:
                            'Produk penelitian sesuai dengan standar laporan TA'),
                    MyInputTextField(
                        teks:
                            'Tahapan pengujian sesuai dengan standar laporan TA'),
                    MyInputTextField(
                        teks: 'Hubungan permasalahan dengan hasil penelitian'),
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
