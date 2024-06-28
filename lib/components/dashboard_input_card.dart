import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/components/dashboard_button.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/utils/storage.dart';

class DashboardInputCard extends ConsumerWidget {
  const DashboardInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String nama = ref.read(storageProvider)['nama'] ?? 'null';
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20),
      shape: const BeveledRectangleBorder(
        side: BorderSide(
          width: .3,
          color: Color.fromARGB(255, 214, 214, 214),
        ),
      ),
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assalamu'alaikum wr. wb.",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primary,
                            fontSize: 20),
                        children: [
                          const TextSpan(
                            text: "Selamat Datang ",
                          ),
                          TextSpan(
                            text: nama,
                            style: TextStyle(
                              color: secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Silakan menginput nilai kerja praktek atau tugas akhir dari mahasiswa yang Anda bimbing atau uji.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const DashboardButton(
                      text: "Input Nilai KP",
                      index: 1,
                    ),
                    const DashboardButton(
                      text: "Input Nilai TA",
                      index: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
