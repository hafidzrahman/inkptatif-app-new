// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkptatif/components/my_second_button.dart';
import 'package:inkptatif/components/my_password_textfield.dart';
import 'package:inkptatif/global.dart';
import '../components/my_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkptatif/utils/storage.dart';
import 'package:inkptatif/utils/session.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  String? _enteredNIP;
  String? _enteredPassword;
  String? _error;
  bool _isLoading = false;

  void onSavedNIP(String? NIP) {
    _enteredNIP = NIP;
  }

  void onSavedPassword(String? password) {
    _enteredPassword = password;
  }

  void onPressLoginButton() async {
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState!.save();
    Uri url = Uri.parse(
        "https://inkptatif.xyz/login.php?app=dosen&action=login");

    try {
      Map<dynamic,dynamic> result = await session.post(url, {
        'nip': _enteredNIP,
        'password': _enteredPassword,
      });

      if (result['token'] == null) {
        throw Exception('Wrong Username or Password.');
      }

      url = Uri.parse("https://inkptatif.xyz/dosen/dosen.php?nip=$_enteredNIP");
      result = await session.get(url);

      print(result);


      ref.read(storageProvider.notifier).setData(result);

      _error = null;
      _isLoading = false;
      // if(!context.mounted) {
      //   return;
      // }

      Navigator.pushNamed(context, '/main-screen');
    } catch (error) {
      print(error);
      setState(() {
        _error = "Wrong Username or Password!";
        _isLoading = false;
      });
    }

    // final url = Uri.https("project-api-ef910-default-rtdb.asia-southeast1.firebasedatabase.app", 'data.json');
    // final url = Uri.parse(
    //     "https://inkptatif.000webhostapp.com/login.php?app=dosen&action=login");
    // final response = await http.Client().post(url,
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode({"nip": _enteredNIP, "password": _enteredPassword}));
    // print(response.body);

// https://inkptatif.000webhostapp.com/login.php?app=dosen&action=login
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double interactableWidgetHeight = height / 16;
    double fontSize = height / 40;

    Widget content = Column(
      children: [
        Image.asset('assets/img/hero-img.png',
            alignment: Alignment.center,
            colorBlendMode: BlendMode.srcIn,
            width: double.infinity,
            height: height * 37 / 100,
            fit: BoxFit.cover),
        SizedBox(height: height / 27),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Aplikasi penginputan nilai untuk dosen pembimbing dan dosen penguji, khusus untuk Kerja Praktek dan Tugas Akhir.',
            style: GoogleFonts.jost(
                fontSize: fontSize,
                color: primary,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: height / 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: interactableWidgetHeight,
                  child: CustomTextField(
                      labelText: 'NIP',
                      prefixIcon: Icon(Icons.person),
                      initialValue: '1234567891011',
                      onSaved: onSavedNIP),
                ),
                SizedBox(height: height / 40),
                SizedBox(
                  height: interactableWidgetHeight,
                  child: MyPasswordTextField(
                      labelText: 'Password',
                      initialValue: '******',
                      onSaved: onSavedPassword),
                ),
                SizedBox(height: height / 40),
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
                              fontSize: fontSize - 4,
                              fontWeight: FontWeight.w600,
                              color: secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _isLoading ? null : () {},
                      child: Text(
                        'Lupa Password?',
                        style: GoogleFonts.jost(
                            fontSize: fontSize - 4,
                            fontWeight: FontWeight.w600,
                            color: secondary,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                ((_error != null)
                    ? Text(_error!,
                        style: GoogleFonts.jost(
                          fontSize: fontSize - 4,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ))
                    : SizedBox(
                        height: height / 40,
                      )),
                SizedBox(
                  height: interactableWidgetHeight,
                  child: MySecondButton(
                    backgroundBtn: primary,
                    text: 'Login',
                    isLoading: _isLoading,
                    onTap: _isLoading ? null : onPressLoginButton,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    if (width >= 600) {
      fontSize = 12;
      interactableWidgetHeight = 40;
      content = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(height: height / 27),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    'Aplikasi penginputan nilai untuk dosen pembimbing dan dosen penguji, khusus untuk Kerja Praktek dan Tugas Akhir.',
                    style: GoogleFonts.jost(
                        fontSize: fontSize + 2,
                        color: primary,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height / 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: interactableWidgetHeight,
                          child: CustomTextField(
                              labelText: 'NIP',
                              prefixIcon: Icon(Icons.person),
                              initialValue: '1234567891011',
                              onSaved: onSavedNIP),
                        ),
                        SizedBox(height: height / 40),
                        SizedBox(
                          height: interactableWidgetHeight,
                          child: MyPasswordTextField(
                              labelText: 'Password',
                              initialValue: '******',
                              onSaved: onSavedPassword),
                        ),
                        SizedBox(height: height / 40),
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
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600,
                                      color: secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: _isLoading ? null : () {},
                              child: Text(
                                'Lupa Password?',
                                style: GoogleFonts.jost(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.w600,
                                    color: secondary,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        ((_error != null)
                            ? Text(_error!,
                                style: GoogleFonts.jost(
                                  fontSize: fontSize + 4,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ))
                            : SizedBox(
                                height: height / 40,
                              )),
                        SizedBox(
                          height: interactableWidgetHeight,
                          child: MySecondButton(
                            backgroundBtn: primary,
                            text: 'Login',
                            isLoading: _isLoading,
                            onTap: _isLoading ? null : onPressLoginButton,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/img/hero-img.png',
              alignment: Alignment.center,
              colorBlendMode: BlendMode.srcIn,
              width: width * 60 / 100,
              height: height - height / 8,
              fit: BoxFit.cover),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        toolbarHeight: height / 8,
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
      body: SingleChildScrollView(child: content),
    );
  }
}
