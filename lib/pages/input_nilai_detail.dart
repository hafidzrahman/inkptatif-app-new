import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/penilaian_avg_card.dart';
import 'package:inkptatif/components/penilaian_dosen_card.dart';
import 'package:inkptatif/components/penilaian_input_card.dart';
import 'package:inkptatif/components/penilaian_mhs_info.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/utils/storage.dart';

class InputNilaiDetail extends ConsumerWidget {
  InputNilaiDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pembimbing = ref.read(storageProvider)['seminar']['pembimbing'];
    final penguji = ref.read(storageProvider)['seminar']['penguji'];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.jost(
                    fontSize: 26,
                    color: primary,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    const TextSpan(
                      text: "Kerja ",
                    ),
                    TextSpan(
                      text: "Praktek",
                      style: TextStyle(
                        color: secondary,
                      ),
                    ),
                  ],
                ),
              ),
             const SizedBox(height: 16),
              Text(
                'menginput nilai kerja praktek dari mahasiswa yang Anda bimbing atau uji.',
                style: GoogleFonts.jost(
                    fontWeight: FontWeight.w600, fontSize: 16, color: primary),
              ),
              PenilaianMhsInfo(),
              PenilaianDosenCard(keterangan: 'pembimbing', nama: pembimbing[0]['nama'], nilai: 90, status: true, daftarNilai: [], nip : pembimbing[0]['nip']),
              PenilaianDosenCard(keterangan: 'penguji', nama: penguji[0]['nama'], nilai: 90, status: true, daftarNilai: [], nip : penguji[1]['nip']),
              PenilaianDosenCard(keterangan: 'pembimbing', nama: pembimbing[1]['nama'], nilai: 90, status: true, daftarNilai: [], nip : pembimbing[0]['nip']),
              PenilaianDosenCard(keterangan: 'penguji', nama: penguji[1]['nama'], nilai: 90, status: true, daftarNilai: [], nip : penguji[1]['nip']),
              PenilaianInputCard(),
              PenilaianAvgCard()
            ],
          ),
        ),
      ),
    );
  }
}
