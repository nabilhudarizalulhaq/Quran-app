import 'package:al_quran/globals.dart';
import 'package:al_quran/screen/home_page.dart';
import 'package:al_quran/screen/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Al-Quran',
      // theme: ThemeData(),
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 0,
          iconTheme: IconThemeData(
            color: backgroundDark,
          ),
        ),
        scaffoldBackgroundColor: backgroundDark,
        colorScheme: const ColorScheme.light(
          background: Color(0xFF040C23),
          primary: Color(0xFFFFFFFF),
          secondary: Color(0xFF091945),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFA19CC5),
          onBackground: Color(0xFF121931),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF091945),
          elevation: 0,
          iconTheme: IconThemeData(
            color: backgroundLight,
          ),
        ),
        scaffoldBackgroundColor: backgroundLight,
        colorScheme: const ColorScheme.dark(
          background: Color(0xFFFFFFFF),
          primary: Color(0xFF672CBC),
          secondary: Color(0xFFFFFFFF),
          onPrimary: Color(0xFF240F4F),
          onSecondary: Color(0xFF8789A3),
          onBackground: Color(0xFFFFFFFF),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
