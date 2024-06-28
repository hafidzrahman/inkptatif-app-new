import 'package:flutter/material.dart';
import 'package:inkptatif/global.dart';
import 'package:fl_chart/fl_chart.dart';

class PenilaianDosenCard extends StatelessWidget {
  String keterangan;
  String nama;
  int nilai;
  bool status;
  List<dynamic> daftarNilai;
  String nip;

  PenilaianDosenCard(
      {required this.keterangan,
      required this.nama,
      required this.nilai,
      required this.status,
      required this.daftarNilai,
      required this.nip,
      super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, double>> points = [
      {'x': 0, 'y': 1},
      {'x': 1, 'y': 3},
      {'x': 2, 'y': 2},
      {'x': 4, 'y': 5}
    ];
    return Card(
      elevation: 5,
      shape: const BeveledRectangleBorder(
        side: BorderSide(
          width: .3,
          color: Color.fromARGB(255, 214, 214, 214),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  keterangan,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: primary,
                  ),
                ),
                Text(
                  nama,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: primary,
                  ),
                ),
                Text(
                  nip,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: secondary,
                  ),
                ),
                const Card(
                  color: Color.fromARGB(255, 0, 255, 0),
                  shape: BeveledRectangleBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal : 20, vertical: 14),
                    child: Text("Sudah", style: TextStyle(
                      fontSize: 16,
                      fontWeight : FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.access_alarm,
                  size: 30,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: LineChart(
                    LineChartData(
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                            spots: points
                                .map(
                                    (point) => FlSpot(point['x']!, point['y']!))
                                .toList())
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
