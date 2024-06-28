// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/responsive/dashboard_landscape.dart';
import 'package:inkptatif/utils/storage.dart';
import 'package:inkptatif/responsive/dashboard_portrait.dart';


// ignore: must_be_immutable
class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    // final userData = ref.read(storageProvider);
    // nama = userData['nama'] ?? 'nama';


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.jost(
                              fontSize: 32,
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              const TextSpan(
                                text: "InKPTA",
                              ),
                              TextSpan(
                                text: "TIF",
                                style: TextStyle(
                                  color: secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "\"Aplikasi Input Nilai KP dan TA Teknik Informatika\" Aplikasi ini berfungsi untuk penginputan nilai untuk dosen pembimbing dan dosen penguji, khusus untuk Kerja Praktek dan Tugas Akhir di jurusan Teknik Informatika.",
                          style: GoogleFonts.jost(
                            color: primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),
                        width >= 600 ? const DashboardLandscape() : const DashboardPortrait(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
