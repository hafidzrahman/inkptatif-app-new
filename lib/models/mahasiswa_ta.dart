// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/tabs/my_ta_list.dart';
import 'package:inkptatif/global.dart';

class MahasiswaTA extends StatelessWidget {
  const MahasiswaTA({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dibimbing = [
      {
        'nama': 'Abmi Sukma Edri',
        'nim': '12050120341',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Ahmad Kurniawan',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Muhammad Faruq',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Belum'
      },
      {
        'nama': 'Aufa Hajati',
        'nim': '12250120338',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Daffa Finanda',
        'nim': '12250111603',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Abmi Sukma Edri',
        'nim': '12050120341',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Ahmad Kurniawan',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Muhammad Faruq',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Belum'
      },
      {
        'nama': 'Aufa Hajati',
        'nim': '12250120338',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Daffa Finanda',
        'nim': '12250111603',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
    ];
    List<Map<String, dynamic>> diuji = [
      {
        'nama': 'Muhammad Faruq',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Belum'
      },
      {
        'nama': 'Muhammad Aditya',
        'nim': '12050120341',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Hafidz Alhadid',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Muhammad Faruq',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Belum'
      },
      {
        'nama': 'Muhammad Aditya',
        'nim': '12050120341',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
      {
        'nama': 'Hafidz Alhadid',
        'nim': '12250111514',
        'foto': 'assets/img/profile.png',
        'status': 'Sudah/90'
      },
    ];

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
                        'Tugas Akhir',
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
                  MyTAList(
                    items: dibimbing
                        .map((item) => {
                              ...item,
                              'kategori': 'dibimbing',
                            })
                        .toList(),
                  ),
                  MyTAList(
                    items: diuji
                        .map((item) => {
                              ...item,
                              'kategori': 'diuji',
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
