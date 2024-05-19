// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';

class MyInputTextField extends StatefulWidget {
  final String teks;
  final TextEditingController controller;
  const MyInputTextField({super.key, required this.teks, required this.controller});

  @override
  State<MyInputTextField> createState() => _MyInputTextFieldState();
}

class _MyInputTextFieldState extends State<MyInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              child: Text(
                widget.teks,
                style: GoogleFonts.jost(
                  fontSize: 16,
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              child: TextField(
                controller: widget.controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondary),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondary),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            )
          ],
        ),
        Container(
          height: 16,
          decoration: BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: secondary, width: 2)),
          ),
        ),
      ],
    );
  }
}
