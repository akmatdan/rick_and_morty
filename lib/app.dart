import 'package:flutter/material.dart';
import 'package:the_rick_and_morty/view/home/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 24, color: Colors.white),
          bodyLarge: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w200, color: Colors.white),
          bodySmall: TextStyle(
              fontSize: 11.0, fontWeight: FontWeight.w100, color: Colors.grey),
        ),
      ),
      home: HomePage(),
    );
  }
}
