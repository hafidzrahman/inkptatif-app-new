// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/tabs/my_kp_list.dart';
import 'package:inkptatif/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';

class InputNilaiList extends ConsumerWidget {
  List<dynamic>? dibimbing;
  List<dynamic>? diuji;
  final String kategori;

  InputNilaiList({super.key, required this.kategori});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.read(storageProvider);

    dibimbing = userData['dibimbing']
        .where((mhs) => mhs['kategori'] == kategori)
        .toList();
    diuji =
        userData['diuji'].where((mhs) => mhs['kategori'] == kategori).toList();
    return Column(
      children: [Expanded(
        child: Scaffold(
          body: DefaultTabController(
            length: 2,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: GoogleFonts.jost(
                              fontSize: 28,
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              const TextSpan(
                                text: "Selamat datang di halaman Input Nilai KP, ",
                              ),
                              TextSpan(
                                text: "Iis Afryanti",
                                style: TextStyle(
                                  color: secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16,),
                          Text(
                            'menginput nilai kerja praktek dari mahasiswa yang Anda bimbing atau uji.',
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: primary),
                          ),
                        ],
                      ), // Atur
                    ),
                  ),
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    shape: Border(
                      bottom: BorderSide(
                        color: secondary,
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: TabBar(
                        unselectedLabelColor: secondary,
                        labelColor: secondary,
                        indicatorColor: primary,
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
        ),
      ),]
    );
  }

  Tab _tabItem({required String label}) => Tab(
        child: Text(
          label,
          style: GoogleFonts.jost(
              color: primary, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );
}



























// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:inkptatif/models/mahasiswa_kp.dart';



// class InputNilaiKP extends StatelessWidget {

//   const InputNilaiKP({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MahasiswaKP();
//   }
// }
