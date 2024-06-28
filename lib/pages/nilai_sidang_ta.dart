// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/components/my_input_textfield.dart';
import 'package:inkptatif/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';
import 'package:inkptatif/utils/session.dart';

class NilaiSidangTA extends ConsumerStatefulWidget {
  final String nama;
  final String nim;
  final String foto;
  final String kategori;
  final String keterangan;
  final List<dynamic> kriteria;

  const NilaiSidangTA({
    super.key,
    required this.nama,
    required this.foto,
    required this.nim,
    required this.kategori,
    required this.keterangan,
    required this.kriteria,
  });

  @override
  ConsumerState<NilaiSidangTA> createState() => _NilaiSidangTAState();
}

class _NilaiSidangTAState extends ConsumerState<NilaiSidangTA> {
  final List<TextEditingController> getInput = [];

  @override
  void dispose() {
    int length = getInput.length;
    for (int i = 0; i < length; i++) {
      getInput[i].dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    int length = widget.kriteria.length;
    for (int i = 0; i < length; i++) {
      getInput.add(TextEditingController());
    }
  }

  void onSave() async {
    int length = getInput.length;
    for (int i = 0; i < length; i++) {
      final id = widget.kriteria[i]['id'];
      final nip = ref.read(storageProvider)['nip'];
      final userInput = getInput[i].text;
      final nim = widget.nim;
      final kategori = widget.kategori;
      final keterangan = widget.keterangan;
      try {
        Uri url =
            Uri.parse('https://inkptatif.xyz/input-nilai/input-nilai.php');
        final result = await session.post(url, {
          'nilai': userInput,
          'id': id,
          'nip': nip,
          'nim': nim,
          'id_kategori': kategori,
          'id_keterangan': keterangan,
        });

        print(result);
        if (context.mounted) {
          return;
        }
        Navigator.of(context).pop();
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: CircleAvatar(
                      radius: 76,
                      backgroundColor: secondary,
                      child: CircleAvatar(
                        radius: 72,
                        backgroundImage: AssetImage(widget.foto),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.nama,
                        style: GoogleFonts.jost(
                          fontSize: 28,
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.nim,
                        style: GoogleFonts.jost(
                          fontSize: 20,
                          color: secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 24,
                decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: primary, width: 4)),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Nilai Sidang TA',
                style: GoogleFonts.jost(
                  fontSize: 32,
                  color: secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (int i = 0; i < getInput.length; i++)
                MyInputTextField(
                    teks: widget.kriteria[i]['penilaian'],
                    controller: getInput[i]),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: MyButton(
                        backgroundBtn: secondary,
                        text: 'Simpan',
                        onTap: onSave,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: MyButton(
                        backgroundBtn: customRed,
                        text: 'Batal',
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
