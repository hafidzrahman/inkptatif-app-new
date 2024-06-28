import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/utils/storage.dart';

class MhsInfoCard extends ConsumerWidget {
  final String kategori;
  final String keterangan;
  const MhsInfoCard({
    super.key,
    required this.kategori,
    required this.keterangan,
  });

  String get getKategori {
    return (kategori[kategori.length-2] + kategori[kategori.length-1]).toLowerCase();
  }

  String get getKeterangan {
    return keterangan.toLowerCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kategoriMhs = getKategori;
    final keteranganMhs = getKeterangan;
    final totalMhs = ref.read(storageProvider)[keteranganMhs].where((mhs) => mhs['kategori'] == kategoriMhs).toList().length;
    return Card(
        shape: const BeveledRectangleBorder(),
        elevation: 3,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kategori,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                    Text(
                      keterangan,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: secondary,
                      ),
                    ),
                    const SizedBox(height: 50,),
                  ],
                ),
              ),
              Positioned(
                width: 200,
                height: 200,
                right: -40,
                bottom: -90,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(55, 59, 130, 246),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 37),
                    child: Text(
                      'Total : $totalMhs',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
