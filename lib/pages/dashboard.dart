// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_historycard.dart';
import 'package:inkptatif/global.dart';
import "package:html/parser.dart";
import "package:http/http.dart" as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void test() async {
    
    // final dio = Dio();
    // await dio.post('http://127.0.0.1/test.php', data : {'id' : 12, 'name' : 'dio'});
    // final coba = await http.Client().get(Uri.parse('http://127.0.0.1:80/test.php'));
    // final decode = jsonDecode(coba.body);
    // print(decode);
    // Map<String, Object> test = {'test': 'coba'};
    // final encode = jsonEncode(test);

    // var coba = await http.post(Uri.parse('http://127.0.0.1:80/test.php'),
    //     headers: {

    //       "Access-Control-Allow-Credentials" : "true",
    //       "Access-Control-Allow-Methods" : "POST",
    //       "Access-Control-Allow-Origin": "*"
    //     });
    // final decode = jsonDecode(coba.body);
    // print(decode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamu'alaikum,",
                style: GoogleFonts.jost(
                  color: primary,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ).copyWith(height: 0),
              ),
              Text(
                "Bu Fulanah",
                style: GoogleFonts.jost(
                  color: secondary,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: secondary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/img/hero-img.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.jost(
                    color: primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: "InKPTA"),
                    TextSpan(
                      text: "TIF",
                      style: TextStyle(
                        color: secondary,
                      ),
                    ),
                    TextSpan(
                      text:
                          " adalah tempat dimana Bapak/Ibu melakukan pengisian nilai mahasiswa Kerja Praktek dan Tugas Akhir.",
                      style: TextStyle(
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History Penilaian KP, Bu Fulanah',
                    style: GoogleFonts.jost(
                      color: primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Atur arah scroll menjadi horizontal
                    child: Row(
                      children: [
                        MyHistoryCard(),
                        SizedBox(width: 16),
                        MyHistoryCard(),
                        SizedBox(width: 16),
                        MyHistoryCard(),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History Penilaian TA, Bu Fulanah',
                    style: GoogleFonts.jost(
                      color: primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Atur arah scroll menjadi horizontal
                    child: Row(
                      children: [
                        MyHistoryCard(),
                        SizedBox(width: 16),
                        MyHistoryCard(),
                        SizedBox(width: 16),
                        MyHistoryCard(),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: test,
                child: Text("COBA TEKAN WOOOOOOOOOOOOOOOOOIIII"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
