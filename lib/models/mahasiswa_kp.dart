// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/tabs/my_kp_list.dart';
import 'package:inkptatif/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';

class MahasiswaKP extends ConsumerWidget {
  List<dynamic>? dibimbing;
  List<dynamic>? diuji;

  MahasiswaKP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.read(storageProvider);
    dibimbing =
        userData['dibimbing'].where((mhs) => mhs['kategori'] == 'kp').toList();
    diuji = userData['diuji'].where((mhs) => mhs['kategori'] == 'kp').toList();

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
                              keterangan: 'dibimbing',
                              items: dibimbing!,
                            ),
                  diuji == null
                      ? Text("Loading")
                      : diuji!.isEmpty
                          ? Text("No Data Found")
                          : MyKPList(
                              keterangan: 'diuji',
                              items: diuji!,
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
