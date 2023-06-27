import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(235, 0, 0, 0),
      cardColor: Colors.grey[850],
      colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 219, 219, 219),
          secondary: Colors.tealAccent,
          onSecondary: Color(0xFFC6C6C6),
          // surface is the "primary" color when in dark mode
          // this gets stacked on top of "scaffod background color"
          // in order to make the app bar and scaffold match, this
          // surface is totally transparent.
          surface: Color.fromARGB(0, 0, 0, 0)),
      primaryColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white));

  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: const Color.fromARGB(235, 0, 0, 0),
    // cardColor: Colors.grey[850],
    colorScheme: const ColorScheme.light(
      primary: Colors.orange,
      secondary: Colors.pinkAccent,
      onSecondary: Colors.purple,
      // surface is the "primary" color when in dark mode
      // this gets stacked on top of "scaffod background color"
      // in order to make the app bar and scaffold match, this
      // surface is totally transparent.
      // surface: Color.fromARGB(0, 0, 0, 0)
    ),
    useMaterial3: true,
    // textTheme: customTextTheme,
    primaryColor: Colors.red,
    // iconTheme: const IconThemeData(color: Colors.white)
  );
}
