import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue, // warna utama
    brightness: Brightness.light,
  ),
  useMaterial3: true, // aktifkan Material 3
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    titleMedium: TextStyle(color: Colors.black87),
  ),
);
