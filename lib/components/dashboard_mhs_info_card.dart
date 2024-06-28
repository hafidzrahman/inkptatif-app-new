import 'package:flutter/material.dart';
import 'package:inkptatif/components/mhs_info_card.dart';


// ignore: must_be_immutable
class DashboardMhsInfoCard extends StatelessWidget {
  DashboardMhsInfoCard({super.key, required this.portrait});
  final bool portrait;
  List<Widget> content = const [
    MhsInfoCard(kategori: 'Mahasiswa KP', keterangan: 'Dibimbing'),
    MhsInfoCard(kategori: 'Mahasiswa KP', keterangan: 'Diuji'),
    MhsInfoCard(kategori: 'Mahasiswa TA', keterangan: 'Dibimbing'),
    MhsInfoCard(kategori: 'Mahasiswa TA', keterangan: 'Diuji'),
  ];

  @override
  Widget build(BuildContext context) {
    if (!portrait) {
      content = const [
        Row(
          children: [
            Expanded(child: MhsInfoCard(kategori: 'Mahasiswa KP', keterangan: 'Dibimbing')),
            Expanded(child: MhsInfoCard(kategori: 'Mahasiswa KP', keterangan: 'Diuji')),
          ],
        ),
        Row(
          children: [
            Expanded(child: MhsInfoCard(kategori: 'Mahasiswa KP', keterangan: 'Dibimbing')),
            Expanded(child: MhsInfoCard(kategori: 'Mahasiswa KP', keterangan: 'Diuji')),
          ],
        )
      ];
    }
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20),
      shape: const BeveledRectangleBorder(
          side:
              BorderSide(width: .3, color: Color.fromARGB(255, 214, 214, 214))),
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(children: content),
        ),
      ),
    );
  }
}
