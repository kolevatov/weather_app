import 'package:flutter/material.dart';

final weatherTheme = ThemeData(
  // colors
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: const Color(0xffee6d5b),
  cardColor: const Color(0xfffd988a),
  //appBar
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.red[500],
    titleTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  // Text
  textTheme: const TextTheme(
    // Title
    titleLarge: TextStyle(fontSize: 24, color: Colors.white),
    titleMedium: TextStyle(fontSize: 18, color: Colors.white),
    titleSmall: TextStyle(
        color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),
    // Headline
    headlineLarge: TextStyle(
        color: Colors.white70, fontSize: 46, fontWeight: FontWeight.w300),
    headlineMedium: TextStyle(
        color: Colors.white, fontSize: 36, fontWeight: FontWeight.w300),
    headlineSmall: TextStyle(fontSize: 16, color: Colors.white70),
    // Body
    bodyLarge: TextStyle(
        color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w300),
    bodyMedium: TextStyle(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w700),
    bodySmall: TextStyle(
        color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w300),
  ),
  // Icons
  iconTheme: const IconThemeData(color: Colors.white),
);
