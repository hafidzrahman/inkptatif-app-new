// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/tabs/my_kp_list.dart';
import 'package:inkptatif/global.dart';
import "package:html/parser.dart";
import "package:http/http.dart" as http;
import 'dart:convert';

class MahasiswaKP extends StatefulWidget {
  const MahasiswaKP({super.key});

  // List<Map<String, dynamic>> diuji = [];

  @override
  State<MahasiswaKP> createState() {
    return _MahasiswaKPState();
  }
}

class _MahasiswaKPState extends State<MahasiswaKP> {
  List<dynamic>? dibimbing;
  List<dynamic>? diuji;

  @override
  void initState() {
    super.initState();
    http.Client()
        .get(Uri.parse(
            'http://127.0.0.1:80/list-kp-ta.php?nip=1223545&kategori=123&status=PM'))
        .then((response) => {
              setState(() {
                dibimbing = jsonDecode(response.body);
                int i = 1;
                if (dibimbing!.length > 1) {
                  while (i < dibimbing!.length) {
                    if (dibimbing![i - 1]['nama'] == dibimbing![i]['nama']) {
                      dibimbing!.remove(dibimbing![i]);
                    } else {
                      i++;
                    }
                  }
                }
              })
            });
    http.Client()
        .get(Uri.parse(
            'http://127.0.0.1:80/list-kp-ta.php?nip=1223545&kategori=123&status=PN'))
        .then((response) => {
              setState(() {
                diuji = jsonDecode(response.body);
                int i = 1;
                if (diuji!.length > 1) {
                  while (i < diuji!.length) {
                    if (diuji![i - 1]['nama'] == diuji![i]['nama']) {
                      diuji!.remove(diuji![i]);
                    } else {
                      i++;
                    }
                  }
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> dibimbing = [
    //   {
    //     'nama': 'Abmi Sukma Edri',
    //     'nim': '12050120341',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Sudah/90'
    //   },
    //   {
    //     'nama': 'Ahmad Kurniawan',
    //     'nim': '12250111514',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Sudah/90'
    //   },
    //   {
    //     'nama': 'Muhammad Faruq',
    //     'nim': '12250111514',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Belum'
    //   },
    //   {
    //     'nama': 'Aufa Hajati',
    //     'nim': '12250120338',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Sudah/90'
    //   },
    //   {
    //     'nama': 'Daffa Finanda',
    //     'nim': '12250111603',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Sudah/90'
    //   },
    // ];
    // List<Map<String, dynamic>> diuji = [
    //   {
    //     'nama': 'Muhammad Faruq',
    //     'nim': '12250111514',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Belum'
    //   },
    //   {
    //     'nama': 'Muhammad Aditya',
    //     'nim': '12050120341',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Sudah/90'
    //   },
    //   {
    //     'nama': 'Hafidz Alhadid',
    //     'nim': '12250111514',
    //     'foto': 'assets/img/profile.png',
    //     'status': 'Sudah/90'
    //   },
    // ];

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      Text(
                        'Daftar Mahasiswa',
                        style: GoogleFonts.jost(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: primary),
                      ),
                      Text(
                        'Kerja Praktek',
                        style: GoogleFonts.jost(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: secondary),
                      ),
                    ],
                  ), // Atur
                ),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: primary,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    color: secondary,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: TabBar(
                    unselectedLabelColor: customWhite,
                    labelColor: secondary,
                    indicatorColor: secondary,
                    indicatorWeight: 4,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      _tabItem(label: 'Yang Dibimbing'),
                      _tabItem(label: 'Yang Diuji'),
                    ],
                  ),
                ),
              )
            ],
            body: Padding(
              padding: EdgeInsets.only(top: 12),
              child: TabBarView(
                children: [
                  dibimbing == null
                      ? Text("Loading")
                      : dibimbing!.isEmpty
                          ? Text("No Data Found")
                          : MyKPList(
                              items: dibimbing!
                                  .map((item) => {
                                        ...item,
                                        'kategori': 'dibimbing',
                                        'foto': 'assets/img/profile.png',
                                        'status': item['nilai'] == null
                                            ? 'Belum'
                                            : 'Sudah',
                                         'statusDosen' : 'PM'  
                                      })
                                  .toList(),
                            ),
                  diuji == null
                      ? Text("Loading")
                      : diuji!.isEmpty
                          ? Text("No Data Found")
                          : MyKPList(
                              items: diuji!
                                  .map((item) => {
                                        ...item,
                                        'kategori': 'diuji',
                                        'foto': 'assets/img/profile.png',
                                        'status': item['nilai'] == null
                                            ? 'Belum'
                                            : 'Sudah',
                                          'statusDosen' : 'PN'
                                      })
                                  .toList(),
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Tab _tabItem({required String label}) => Tab(
        child: Text(
          label,
          style: GoogleFonts.jost(
              color: customWhite, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );
}
