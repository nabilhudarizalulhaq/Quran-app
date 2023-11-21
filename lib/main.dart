import 'package:al_quran/screen/home_page.dart';
import 'package:al_quran/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Al-Quran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const SplashPage(),
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        // '/surah':(context) => const SurahTabPage(),
        // '/login': (context) => const SignInPage(),
        // '/sign_up': (context) => const SignUpPage(),
        // '/home': (context) => const HomePage(),
        // '/profile': (context) => const ProfilePage(),
        // '/setting': (context) => const SettingPage(),
      },
    );
  }
}
