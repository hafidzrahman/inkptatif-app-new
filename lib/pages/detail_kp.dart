// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/nilai_bimbingan_kp.dart';
import 'package:inkptatif/pages/nilai_seminar_kp.dart';

class DetailKP extends StatelessWidget {
  final String nama;
  final String nim;
  final String kategori;
  final String foto;
  final String keterangan;
  final Map<dynamic, dynamic> decodedData;
  final List<dynamic> kriteria;

  const DetailKP({
    super.key,
    required this.nama,
    required this.nim,
    required this.kategori,
    required this.foto,
    required this.keterangan,
    required this.decodedData,
    required this.kriteria,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: SingleChildScrollView(
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
                          backgroundImage:
                              AssetImage("assets/img/hero-img.png"),
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
                        decodedData == null
                            ? "Loading "
                            : decodedData.isEmpty
                                ? "-"
                                : decodedData['pembimbing'][0]['nama'],
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
                        decodedData == null
                            ? "Loading "
                            : decodedData['pembimbing'].length == 1
                                ? "-"
                                : decodedData['pembimbing'][1]['nama'],
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
                        decodedData == null
                            ? "Loading "
                            : decodedData.isEmpty
                                ? "-"
                                : decodedData['judul'],
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
                        decodedData == null
                            ? "Loading "
                            : decodedData.isEmpty
                                ? "-"
                                : decodedData['tanggal'] +
                                    " - " +
                                    decodedData['tempat'],
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
                  // Expanded(
                  //   child: SizedBox(
                  //     width: 100,
                  //     child: MyButton(
                  //         backgroundBtn: customGreen,
                  //         text: "Lihat"),
                  //   ),
                  // ),
                  // SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: MyButton(
                        backgroundBtn: secondary,
                        text: 'Edit',
                        onTap: () {
                          if (keterangan == 'dibimbing') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NilaiBimbinganKP(
                                  nama: nama,
                                  kategori: kategori,
                                  foto: 'assets/img/profile.png',
                                  nim: nim,
                                  kriteria: kriteria,
                                  keterangan: keterangan,
                                ),
                              ),
                            );
                          } else if (keterangan == 'diuji') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NilaiSeminarKP(
                                          nama: nama,
                                          kategori: kategori,
                                          foto: 'assets/img/profile.png',
                                          nim: nim,
                                          kriteria : kriteria,
                                          keterangan : keterangan
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
      ),
    );
  }
}
