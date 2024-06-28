import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/global.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Icon? prefixIcon;
  final String initialValue;
  final bool obscureText;
  final IconButton? suffixIcon;
  
  void Function(String?) onSaved;

  CustomTextField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.initialValue = '',
    this.obscureText = false,
    this.suffixIcon,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: secondary,
      cursorWidth: 2,
      obscureText: obscureText,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            GoogleFonts.jost(color: primary, fontWeight: FontWeight.w600),
        prefixIcon: prefixIcon,
        prefixIconColor: primary,
        suffixIcon: suffixIcon,
        suffixIconColor: primary,
        hintText: initialValue,
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
      onSaved: onSaved,
    );
  }
}
