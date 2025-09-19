import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BioMed',
      theme: appTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        // HomePage sekarang butuh username, jadi kita hapus const dan tambahkan dummy username dulu
        '/home': (context) => HomePage(username: 'User'),
      },
    );
  }
}
