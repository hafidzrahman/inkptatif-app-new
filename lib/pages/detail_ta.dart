// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/nilai_bimbingan_ta.dart';
import 'package:inkptatif/pages/nilai_sidang_ta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailTA extends StatefulWidget {
  final String nama;
  final String nim;
  final String foto;
  final String kategori;
  final String statusDosen;

  const DetailTA({
    super.key,
    required this.nama,
    required this.foto,
    required this.nim,
    required this.kategori,
    required this.statusDosen
  });

    @override
    State<DetailTA> createState() => _DetailTAState();
}

  class _DetailTAState extends State<DetailTA> {

    List<dynamic>? decodedData;
    List<dynamic>? penilaian;

  @override
  void initState() {
    super.initState();
    http.Client().get(Uri.parse('http://127.0.0.1:80/detail-kp-ta.php?nim=${widget.nim}&kategori=124&status=${widget.statusDosen}'))
    .then((response) => {
      setState(()
      {
        decodedData = jsonDecode(response.body);
    })
    }
    );
    http.Client().get(Uri.parse('http://127.0.0.1:80/penilaian.php?nip=1223545&nim=${widget.nim}&kategori=123&status=${widget.statusDosen}'))
    .then((response) => {
      setState(()
      {
        penilaian = jsonDecode(response.body);
        print(penilaian);
    })
    }
    );
  }

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
                        backgroundImage: AssetImage(widget.foto),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
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
                      decodedData == null ? "Loading " : decodedData!.isEmpty ? "-" : decodedData![0]['nama'],
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
                      decodedData == null ? "Loading " : decodedData!.length == 1 ? "-" : decodedData![1]['nama'],
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
                      decodedData == null ? "Loading " : decodedData!.isEmpty ? "-" : decodedData![0]['judul'],
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
                      decodedData == null ? "Loading " : decodedData!.isEmpty ? "-" : decodedData![0]['tanggal'] + " - " + decodedData![0]['tempat'],
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
                        if (widget.kategori == 'dibimbing' && penilaian != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NilaiBimbinganTA(
                                        nama: widget.nama,
                                        kategori: widget.kategori,
                                        foto: widget.foto,
                                        nim: widget.nim,
                                        penilaian: penilaian!,
                                        statusDosen: widget.statusDosen
                                      )));
                        } else if (widget.kategori == 'diuji' && penilaian != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NilaiSidangTA(
                                        nama: widget.nama,
                                        kategori: widget.kategori,
                                        foto: widget.foto,
                                        nim: widget.nim,
                                        penilaian: penilaian!,
                                        statusDosen: widget.statusDosen
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
