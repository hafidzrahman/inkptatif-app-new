// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inkptatif/models/mahasiswa_ta.dart';

class InputNilaiTA extends StatefulWidget {
  const InputNilaiTA({super.key});

  @override
  State<InputNilaiTA> createState() => _InputNilaiTAState();
}

class _InputNilaiTAState extends State<InputNilaiTA> {
  @override
  Widget build(BuildContext context) {
    return MahasiswaTA();
  }
}
