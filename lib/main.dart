import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi 2 Mobile Paket 3',
      theme: ThemeData(
        primaryColor: const Color(0xFF8D6E63),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF8D6E63),
          secondary: const Color(0xFFFFA726),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8D6E63),
          elevation: 4,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF8D6E63),
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
