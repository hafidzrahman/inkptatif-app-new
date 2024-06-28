import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/components/mhs_info_card_row.dart';
import 'package:inkptatif/global.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:inkptatif/utils/storage.dart';

class PenilaianMhsInfo extends ConsumerStatefulWidget {
  const PenilaianMhsInfo({super.key});

  @override
  ConsumerState<PenilaianMhsInfo> createState() => _PenilaianMhsInfoState();
}

class _PenilaianMhsInfoState extends ConsumerState<PenilaianMhsInfo> {
  String text = "";
  int touchedIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    final penilaian = ref.read(storageProvider)['penilaian']['penilaian'];
    final userSeminarData =  ref.read(storageProvider)['seminar'];
    
    return Card(
      elevation: 5,
      shape: const BeveledRectangleBorder(
        side: BorderSide(
          width: .3,
          color: Color.fromARGB(255, 214, 214, 214),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seminar KP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            MhsInfoCardRow(title: userSeminarData['nama'], description: userSeminarData['nim']),
            MhsInfoCardRow(title: 'Judul', description: userSeminarData['judul']),
            MhsInfoCardRow(title: "Tanggal", description: userSeminarData['tanggal']),
            MhsInfoCardRow(title: "Tempat", description: userSeminarData['tempat']),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Distribusi Nilai",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 1,
                        centerSpaceRadius: 0,
                        pieTouchData: PieTouchData(
                            touchCallback: (event, response) => {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        (response == null) ||
                                        (response!.touchedSection == null)) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = response!
                                        .touchedSection!.touchedSectionIndex;
                                  }),
                                }),
                        sections: List<PieChartSectionData>.generate(penilaian.length, (i) {
                          double value = (penilaian[i]['nilai'] / 100) * 100 / penilaian.length;
                          final isTouched = i == touchedIndex;
                          final radius = isTouched ? 70.0 : 50.0;
                          return PieChartSectionData(
                              badgeWidget: isTouched
                                  ?  Card(
                                      shape: const BeveledRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black,
                                            strokeAlign: .3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Text('${penilaian[i]['kriteria']} : ${penilaian[i]['nilai']}'),
                                      ),
                                    )
                                  : null,
                              badgePositionPercentageOffset: 1.3,
                              value: value,
                              title: 'Internet',
                              titleStyle: TextStyle(
                                fontSize: 20,
                              ),
                              showTitle: false,
                              radius: radius,
                              color: Colors.purple);
                        }),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
