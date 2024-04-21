// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_button.dart';
import 'package:inkptatif/components/my_password_textfield.dart';
import 'package:inkptatif/global.dart';
import '../components/my_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        toolbarHeight: 88,
        title: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.jost(
                fontSize: 32,
                color: customWhite,
                fontWeight: FontWeight.w600,
              ),
              children: [
                const TextSpan(
                  text: "InKPTA",
                ),
                TextSpan(
                  text: "TIF",
                  style: TextStyle(
                    color: secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/img/hero-img.png',
            alignment: Alignment.center,
            colorBlendMode: BlendMode.srcIn,
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Aplikasi penginputan nilai untuk dosen pembimbing dan dosen penguji, khusus untuk Kerja Praktek dan Tugas Akhir.',
              style: GoogleFonts.jost(
                  fontSize: 18, color: primary, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    labelText: 'NIP',
                    prefixIcon: Icon(Icons.person),
                    initialValue: '1234567891011',
                  ),
                  SizedBox(height: 16),
                  MyPasswordTextField(
                    labelText: 'Password',
                    initialValue: '******',
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rememberMe =
                                !_rememberMe; // Toggle nilai _rememberMe
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: secondary,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: GoogleFonts.jost(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Lupa Password?',
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: secondary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyButton(
                    backgroundBtn: primary,
                    text: 'Login',
                    onTap: () => {Navigator.pushNamed(context, '/main-screen')},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
