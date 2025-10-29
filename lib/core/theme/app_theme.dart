import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  final ColorScheme scheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent);
  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: scheme.background,
      foregroundColor: scheme.onBackground,
    ),
    cardTheme: CardTheme(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

ThemeData buildDarkTheme() {
  final ColorScheme scheme = ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.dark,
  );
  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
  );
}
