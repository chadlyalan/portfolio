import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(235, 0, 0, 0),
      cardColor: Colors.grey[850],
      colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 219, 219, 219),
          secondary: Colors.tealAccent,
          onSecondary: const Color(0xFFC6C6C6),
          background: Colors.grey[850]!,
          // surface is the "primary" color when in dark mode
          // this gets stacked on top of "scaffod background color"
          // in order to make the app bar and scaffold match, this
          // surface is totally transparent.
          surface: const Color.fromARGB(0, 0, 0, 0)),
      //useMaterial3: true,
      primaryColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 93, 203, 172),
      cardColor: const Color.fromARGB(255, 232, 167, 124),
      colorScheme: const ColorScheme.light(
        primary: Colors.white,
        secondary: Color.fromARGB(255, 197, 125, 146),
        // onSecondary: Colors.green,
        background: Color.fromARGB(255, 59, 99, 88),
        //surface:  Color.fromARGB(255, 65, 179, 164)
      ),
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromARGB(255, 93, 203, 172)),
      // useMaterial3: true,
      primaryColor: Colors.black,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white)));
}

// light orange   Color.fromARGB(255, 232, 167, 124)
// light mint     Color.fromARGB(255, 133, 220, 187)
// main teal      Color.fromARGB(255, 65, 179, 164)
// off pink       Color.fromARGB(255, 195, 141, 158)

// new colors
// main orange    Color.fromARGB(255, 226, 124, 96)
// teal           Color.fromARGB(255, 93, 203, 172)

// Color.fromARGB(255, 59, 99, 88)
