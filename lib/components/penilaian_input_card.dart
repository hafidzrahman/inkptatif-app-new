import 'package:flutter/material.dart';
import 'package:inkptatif/components/penilaian_input_item.dart';
import 'package:inkptatif/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/session.dart';
import 'package:inkptatif/utils/storage.dart';

class PenilaianInputCard extends ConsumerWidget {
  const PenilaianInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final penilaian = ref.read(storageProvider)['penilaian']['penilaian'];
    final kriteria = ref.read(storageProvider)['kriteria'];
    final userData = ref.read(storageProvider);
    print(userData);
    print(kriteria);
    return Card(
      elevation: 2,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          strokeAlign: .3,
          color: primary,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Penilaian",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: primary),
                ),
                const SizedBox(height: 6),
                ...penilaian
                    .map(
                      (item) => PenilaianInputItem(
                        title: item['kriteria'],
                        nilai: item['nilai'],
                      ),
                    )
                    .toList(),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                  child: const Text(
                    "Submit",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    final result = ref.read(storageNilaiProvider);
                    Uri url = Uri.parse('https://inkptatif.xyz/kategori/kategori.php?jenis=kp');
                    final id_kategori = await session.get(url);

                    url = Uri.parse('https://inkptatif.xyz/keterangan/keterangan.php?jenis=dibimbing');
                    final id_keterangan = await session.get(url);

                    url = Uri.parse("https://inkptatif.xyz/input-nilai/input-nilai.php");
                    final response = await session.post(url, {
                      'data' : {
                        'id_kriteria' : kriteria.map((k) => k.id),
                        'nilai' : 99,
                        'nip' : userData['nip'],
                        'id_kategori' : id_kategori['data']['id'],
                        'id_keterangan' : id_keterangan['data']['id']
                      },
                    });
                    print(response);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
