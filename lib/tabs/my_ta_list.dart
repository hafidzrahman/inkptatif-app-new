// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/detail_ta.dart';
import 'package:inkptatif/utils/session.dart';

class MyTAList extends StatelessWidget {
  final String keterangan;
  final List<dynamic> items;
  const MyTAList({super.key, required this.items, required this.keterangan});

  void onTap(BuildContext context, Map<dynamic, dynamic> item) async {
    try {
      Uri url = Uri.parse(
          "https://inkptatif.xyz/seminar/seminar.php?nim=${item['nim']}");
      final decodedData = await session.get(url);

      url = Uri.parse(
          "https://inkptatif.xyz/input-nilai/kriteria.php?jenis_kategori=${item['kategori']}&jenis_keterangan=$keterangan");
      final kriteria = await session.getArray(url);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailTA(
          nama: item['nama'],
          nim: item['nim'],
          foto: 'assets/img/profile.png',
          kategori: item['kategori'],
          keterangan: keterangan,
          decodedData: decodedData,
          kriteria: kriteria,
        ),
      ));
    } catch (error) {
      print(error);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
        thickness: 1.0,
        indent: 20,
        endIndent: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            onTap(context, item);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/img/profile.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['nama'],
                      style: GoogleFonts.jost(
                        fontSize: 20,
                        color: primary,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          item['nim'],
                          style: GoogleFonts.jost(fontSize: 16, color: primary),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  'Sudah/90',
                  style: GoogleFonts.jost(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: item['status'] == 'Belum' ? customRed : customGreen,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
