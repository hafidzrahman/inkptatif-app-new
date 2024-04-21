// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inkptatif/models/mahasiswa_kp.dart';

class InputNilaiKP extends StatefulWidget {
  const InputNilaiKP({super.key});

  @override
  State<InputNilaiKP> createState() => _InputNilaiKPState();
}

class _InputNilaiKPState extends State<InputNilaiKP> {
  @override
  Widget build(BuildContext context) {
    return MahasiswaKP();
  }
}
