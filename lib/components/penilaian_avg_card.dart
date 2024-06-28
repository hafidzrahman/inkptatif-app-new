import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:inkptatif/global.dart';

class PenilaianAvgCard extends StatelessWidget {
  PenilaianAvgCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const BeveledRectangleBorder(
        side: BorderSide(
            color: Color.fromARGB(255, 224, 224, 224), strokeAlign: .3),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox(
              width: 300,
              height: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 129, 245, 133),
                              Colors.white
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      spots: [
                        FlSpot(1, 1),
                        FlSpot(2, 2),
                        FlSpot(3, 3),
                        FlSpot(4, 4),
                        FlSpot(5, 5),
                      ],
                    ),
                  ],
                  minX: 1,
                  maxX: 5,
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text("Nilai"),
                      sideTitles: SideTitles(
                        reservedSize: 60,
                        interval : 1,
                          getTitlesWidget: (a, b) {
                            String text;
                            switch (a.toInt()) {
                              case 1:
                                text = "Tanggung Jawab";
                                break;
                              case 2:
                                text = "Tanggung Jawab";
                                break;
                              case 3:
                                text = "Tanggung Jawab";
                                break;
                              case 4:
                                text = "Tanggung Jawab";
                                break;
                                case 5:
                                text = "Tanggung Jawab";
                                break;
                              default:
                                return Container();
                            }
                            return Text(
                              text,
                              style: TextStyle(fontSize: 8, color: primary),
                              textAlign: TextAlign.left,
                            );
                          },
                          showTitles: true),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
