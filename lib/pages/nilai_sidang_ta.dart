// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inkptatif/components/my_appbar.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/components/my_input_textfield.dart';
import 'package:inkptatif/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class NilaiSidangTA extends StatefulWidget {
  final String nama;
  final String nim;
  final String foto;
  final String kategori;
  final String statusDosen;
  final List<dynamic> penilaian;

  const NilaiSidangTA({
    super.key,
    required this.nama,
    required this.foto,
    required this.nim,
    required this.kategori,
    required this.penilaian,
    required this.statusDosen
  });

  @override
  State<NilaiSidangTA> createState() => _NilaiSidangTAState();
}

class _NilaiSidangTAState extends State<NilaiSidangTA> {

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
    int length = widget.penilaian.length;
    for (int i = 0; i < length; i++) {
      getInput.add(TextEditingController(text : widget.penilaian[i]['nilai'].toString()));
    }
  }

  void onSave(context) async {
    int length = widget.penilaian.length;
    for (int i = 0; i < length; i++) {
        await http.Client().get(Uri.parse('http://127.0.0.1:80/input-nilai.php?nip=1223545&nim=${widget.nim}&kategori=123&status=${widget.statusDosen}&nilai=${getInput[i].text.toString()}&id=${widget.penilaian[i]['id']}'));
        print(widget.penilaian[i]['id']);
    }
    Navigator.of(context).pop();
    // final decode = jsonDecode(test.body);
    // print(widget.penilaian);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
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
            SizedBox(
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < widget.penilaian.length; i++) 
                    MyInputTextField(teks: widget.penilaian[i]['keterangan'], controller: getInput[i])
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: MyButton(backgroundBtn: secondary, text: 'Simpan'),
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
    );
  }
}
