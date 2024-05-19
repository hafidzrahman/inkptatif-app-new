// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inkptatif/models/mahasiswa_kp.dart';
import "package:html/parser.dart";
import "package:http/http.dart" as http;
import 'dart:convert';

class InputNilaiKP extends StatefulWidget {
  const InputNilaiKP({super.key});

  
  @override
  State<InputNilaiKP> createState() => _InputNilaiKPState();
}

class _InputNilaiKPState extends State<InputNilaiKP> {
  // List<dynamic>? data;

  // @override
  // void initState() {
  //   super.initState();
  //   http.Client()
  //       .get(Uri.parse('http://127.0.0.1:80/list-kp.php?nip=1223545&kategori=123'))
  //       .then((response) => {
  //             setState(() {
  //               data = jsonDecode(response.body);
  //             })
  //           });
  // }

  @override
  Widget build(BuildContext context) {



    

    // if (data.isEmpty) {
    // http.Client()
    //     .get(Uri.parse('http://127.0.0.1:80/list-kp.php'))
    //     .then((response) => {
    //           setState(() {
    //             data = jsonDecode(response.body);
    //             print(data);
    //           })
    //         });
    // } else {
    //   return MahasiswaKP(
    //   dibimbing: data,
    // );
    // }

    // if (data == null) {
    //   return Text("Loading");
    // } else if (data!.isEmpty) {
    //   return Text("No Data Found");
    // }
    
    return MahasiswaKP();
  }
}
