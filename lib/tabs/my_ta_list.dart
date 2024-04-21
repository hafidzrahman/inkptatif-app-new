// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';
import 'package:inkptatif/pages/detail_ta.dart';

class MyTAList extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const MyTAList({super.key, required this.items});

  @override
  State<MyTAList> createState() => _MyTAListState();
}

class _MyTAListState extends State<MyTAList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.items.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
        thickness: 1.0,
        indent: 20,
        endIndent: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = widget.items[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailTA(
                nama: item['nama'],
                foto: item['foto'],
                nim: item['nim'],
                kategori: item['kategori'],
              ),
            ));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(item['foto']),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['nama'],
                      style: GoogleFonts.jost(
                        fontSize: 20,
                        color: primary,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          item['nim'],
                          style: GoogleFonts.jost(fontSize: 16, color: primary),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  item['status'],
                  style: GoogleFonts.jost(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: item['status'] == 'Belum' ? customRed : customGreen,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
