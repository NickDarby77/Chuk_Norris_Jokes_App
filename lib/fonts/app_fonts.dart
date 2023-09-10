import 'package:flutter/material.dart';

abstract class AppFonts {
  static const TextStyle jokeStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    fixedSize: const Size(double.maxFinite, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
  );

  static const TextStyle getJokeStyle = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: Colors.indigo,
  );

  static const TextStyle languagesStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}
