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

      // Light Theme (default)
      theme: appTheme,

      // Dark Theme
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      // Mode otomatis ikut sistem (bisa Light atau Dark)
      themeMode: ThemeMode.system,

      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
      },

      // Gunakan onGenerateRoute untuk handle passing data (username)
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final username = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => HomePage(username: username),
          );
        }
        return null;
      },
    );
  }
}
