// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/detail_kp.dart';
import 'package:inkptatif/utils/session.dart';
import 'package:inkptatif/pages/input_nilai_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';

class MyKPList extends ConsumerWidget {
  final List<dynamic> items;
  final String keterangan;
  const MyKPList({super.key, required this.items, required this.keterangan});

  void onTap(BuildContext context, Map<dynamic, dynamic> item, WidgetRef ref) async {
    try {
      Uri url = Uri.parse(
          "https://inkptatif.xyz/seminar/seminar.php?nim=${item['nim']}");
      final decodedData = await session.get(url);

      ref.read(storageProvider.notifier).addData('seminar', decodedData);

      url = Uri.parse(
          "https://inkptatif.xyz/input-nilai/kriteria.php?jenis_kategori=${item['kategori']}&jenis_keterangan=$keterangan");
      final kriteria = await session.getArray(url);

      ref.read(storageProvider.notifier).addData('kriteria', kriteria);

      final result = ref.read(storageProvider);
      print(result);

      url = Uri.parse(
          "https://inkptatif.xyz/penilaian/penilaian.php?nip=${result['nip']}&nim=${result['seminar']['nim']}");
      final penilaian = await session.get(url);
      ref.read(storageProvider.notifier).addData('penilaian', penilaian);


      // Uri url =
      //       Uri.parse('https://inkptatif.xyz/input-nilai/input-nilai.php');

      //   final result = await session.post(url, {
      //     'nilai': userInput,
      //     'id': id,
      //     'nip': nip,
      //     'nim': nim,
      //     'id_kategori': kategori,
      //     'id_keterangan': keterangan,
      //   });

        // print(result);
      
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InputNilaiDetail()
      ));

      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => DetailKP(
      //     nama: item['nama'],
      //     nim: item['nim'],
      //     foto: 'assets/img/profile.png',
      //     kategori: item['kategori'],
      //     keterangan: keterangan,
      //     decodedData: decodedData,
      //     kriteria: kriteria,
      //   ),
      // ));

      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => (
      //     nama: item['nama'],
      //     nim: item['nim'],
      //     foto: 'assets/img/profile.png',
      //     kategori: item['kategori'],
      //     keterangan: keterangan,
      //     decodedData: decodedData,
      //     kriteria: kriteria,
      //   ),
      // ));

    } catch (error) {
      print(error);
      return;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onTap(context, item, ref);
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
                  "Sudah",
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
