// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inkptatif/screens/main_screen.dart';
import 'package:inkptatif/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/main-screen': (context) => MainScreen(),
      },
    );
  }
}
