// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors
import 'package:inkptatif/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPasswordTextField extends StatefulWidget {
  final String labelText;
  final String initialValue;
  final bool obscureText;

  const MyPasswordTextField({
    super.key, // Perbaiki penulisan key
    required this.labelText,
    this.initialValue = '',
    this.obscureText = true,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<MyPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      cursorColor: secondary,
      cursorWidth: 2,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:
            GoogleFonts.jost(color: primary, fontWeight: FontWeight.w600),
        prefixIcon: Icon(Icons.lock),
        prefixIconColor: primary,
        suffixIcon: IconButton(
          icon:
              Icon(_obscureText ? Icons.remove_red_eye : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        suffixIconColor: primary,
        hintText: widget.initialValue,
        hintStyle: GoogleFonts.jost(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondary),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondary),
            borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
